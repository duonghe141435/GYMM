package swp12.gym.utils;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;

public class SaveImageFunctions {

    public static String doSaveFileToService(CommonsMultipartFile file, HttpSession s, String root_file){
        try {
            byte[] data = file.getBytes();
            //we have to save this file to server...
            String path = s.getServletContext().getRealPath("/") + "assets" + File.separator + "img" + File.separator +
                    root_file + File.separator + file.getOriginalFilename();

            FileOutputStream fos = new FileOutputStream(path);
            // Tiến hành lưu file
            fos.write(data);
            fos.close();

            return "luu file thanh cong";

        }catch (Exception e){
            return "Loi: "+e.getMessage();
        }
    }
}
