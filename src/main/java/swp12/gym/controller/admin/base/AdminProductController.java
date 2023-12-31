package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import swp12.gym.dto.ProductDto;
import swp12.gym.model.entity.Price;
import swp12.gym.model.entity.ProductType;
import swp12.gym.model.entity.Unit;
import swp12.gym.service.PriceService;
import swp12.gym.service.ProductService;
import swp12.gym.service.ProductTypeService;
import swp12.gym.service.UnitService;
import swp12.gym.common.FileUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private PriceService priceService;
    @Autowired
    private UnitService unitService;
    @Autowired
    private ProductTypeService productTypeService;

    @RequestMapping(value = "/page={pagination}-status={status}",method = RequestMethod.GET)
    public String goListProdcut(@PathVariable String pagination,
                                      @PathVariable String status, Model model){

        try {
            //kiểm tra có phải là số int ko?
            int status_num = Integer.parseInt(status);
            int pagination_value = Integer.parseInt(pagination);
            int totalPages = 1;
            int count_row = productService.getNumberProductInSystemAdmin(status_num);
            if(count_row != 0){
                totalPages = (int) Math.ceil((double) count_row / 8);
            }
            if(pagination_value > totalPages){
                return "base/404";
            }else if(pagination_value < 1){
                return "base/404";
            }else {
                List<ProductDto> productDtos = productService.findListProduct(pagination_value, status_num);
                model.addAttribute("count", count_row);
                model.addAttribute("status", status);
                model.addAttribute("totalPages",totalPages);
                model.addAttribute("pagination",pagination_value);
                model.addAttribute("productDtos", productDtos);
                return "admin/product/list_product";
            }
        }catch (Exception e){
            e.printStackTrace();
            return "base/404";
        }

    }

    @RequestMapping(value = "/new-product",method = RequestMethod.GET)
    public String goCreateTicket(Model model){
        List<Unit> units = unitService.findAll();
        List<ProductType> productTypes = productTypeService.findAll();

        model.addAttribute("productType", productTypes);
        model.addAttribute("units", units);
        model.addAttribute("product", new ProductDto());
        return "admin/product/create_product";
    }

    @RequestMapping(value = "/new-product/save",method = RequestMethod.POST)
    public String goSaveProduct(@ModelAttribute("product") ProductDto productDto,
                                @RequestParam("file-up") CommonsMultipartFile file, HttpSession s){
        int p_id = productService.getNumberProductInSystem() + 1;
        String p_img = "/assets/img/products/"+file.getOriginalFilename();

        productDto.setP_id(p_id);
        productDto.setP_img(p_img);

        productService.createProduct(productDto);
        priceService.createAnPrice(productDto.getP_price(),productDto.getP_Oprice(),p_id);
        FileUtil.doSaveImgToService(file,s,"products");
        return "redirect:/admin/product/page=1-status=1";
    }

    @RequestMapping(value = "/search/{query}", method = RequestMethod.GET)
    public String goUpdateUser(@PathVariable String query,
                               Model model) {
        List<ProductDto> results = productService.searchProductAdmin(query);
        model.addAttribute("productDtos", results);
        return "admin/product/search_product";
    }

    @RequestMapping(value = "/detail-product/{id}",method = RequestMethod.GET)
    public String goViewDetailProduct(@PathVariable int id, Model model){
        ProductDto productDto = productService.findAnProduct(id);
        List<Price> prices = priceService.getPriceAnProduct(id);

        List<Unit> units = unitService.findAll();
        List<ProductType> productTypes = productTypeService.findAll();


        model.addAttribute("productType", productTypes);
        model.addAttribute("units", units);

        model.addAttribute("product",productDto);
        model.addAttribute("prices", prices);
        return "admin/product/detail_product";
    }

    @RequestMapping(value = "/update-product",method = RequestMethod.POST)
    public String goUpdateProduct(@RequestParam("file-up") CommonsMultipartFile file,
                               @ModelAttribute("product") ProductDto productDto, HttpSession s, HttpServletRequest request ) {
        //lấy data product cũ
        ProductDto getProductDto = productService.findAnProduct(productDto.getP_id());
        Price price = priceService.getAnPriceAnProduct(productDto.getP_id());
        String u_img = getProductDto.getP_img();
        if(!file.getOriginalFilename().equals("") && file.getOriginalFilename() != null){
            u_img = "/assets/img/products/"+file.getOriginalFilename();
            if(!u_img.equalsIgnoreCase(productDto.getP_img())){
                FileUtil.doSaveImgToService(file,s,"products");
                productDto.setP_img(u_img);
            }
        }


        if(productDto.getP_price() != price.getPri_sale() || productDto.getP_Oprice() != price.getPri_oprice()){

            priceService.updatePrice(price.getPri_id());
            priceService.createAnPrice(productDto.getP_price(), productDto.getP_Oprice(), productDto.getP_id());
        }

        if (!productDto.getP_name().equals(getProductDto.getP_name()) ||
                (productDto.getP_quantity() != getProductDto.getP_quantity() && productDto.getP_quantity() >= getProductDto.getP_quantity()) ||
                    !productDto.getP_description().equals(getProductDto.getP_description()) ||
                        productDto.getP_unit() != getProductDto.getP_unit() ||
                            productDto.getP_kind() != getProductDto.getP_kind() ||
                                !u_img.equals(getProductDto.getP_img())){

            productService.updateProduct(productDto, u_img);
        }
        return "redirect:/admin/product/detail-product/" + productDto.getP_id();
    }
}
