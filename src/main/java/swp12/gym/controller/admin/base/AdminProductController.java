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

    @RequestMapping(method = RequestMethod.GET)
    public String goDashbroashProdcut(Model model){
        List<ProductDto> productDtos = productService.findAll();

        model.addAttribute("productDtos", productDtos);
        return "admin/product/list_product";
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
        return "redirect:/admin/product";
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public String goViewUser(@PathVariable int id, Model model){
        ProductDto productDto = productService.findAnProduct(id);
        List<Unit> units = unitService.findAll();
        List<ProductType> productTypes = productTypeService.findAll();
        List<Price> prices = priceService.getPriceAnProduct(id);

        model.addAttribute("productType", productTypes);
        model.addAttribute("units", units);
        model.addAttribute("product",productDto);
        model.addAttribute("prices", prices);
        return "admin/product/update_product";
    }

    @RequestMapping(value = "/update-product",method = RequestMethod.POST)
    public String goUpdateUser(@RequestParam("file-up") CommonsMultipartFile file,
                               @ModelAttribute("product") ProductDto productDto, HttpSession s, HttpServletRequest request ) {

        if(!file.getOriginalFilename().equals("") && file.getOriginalFilename() != null){
            String u_img = "/assets/img/products/"+file.getOriginalFilename();
            if(!u_img.equalsIgnoreCase(productDto.getP_img())){
                FileUtil.doSaveImgToService(file,s,"products");
                productDto.setP_img(u_img);
            }
        }

        String old_price = request.getParameter("old_price");
        float old_price_int = Float.parseFloat(old_price);


        if(productDto.getP_price() != old_price_int){
            priceService.updatePrice(productDto.getP_price_id());
            priceService.createAnPrice(productDto.getP_price(), productDto.getP_Oprice(), productDto.getP_id());
        }else
            productService.updateProduct(productDto.getP_img(),productDto.getP_description(), productDto.getP_kind(),
                    productDto.getP_unit(),productDto.getP_id());

        return "redirect:/admin/dashboard/products";
    }
}
