package com.hotel.demo.controller;

import com.hotel.demo.entity.UploadFileEntity;
import com.hotel.demo.model.ResultModel;
import com.hotel.demo.repository.UploadFileRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@RestController
public class UploadController {

    @Resource
    UploadFileRepository repository;

    @Value("${my.upload-path}")
    private String uploadPath;

    @PostMapping("upload")
    public ResultModel upload(@RequestParam("file")MultipartFile file) {
        String filename = file.getOriginalFilename();
        Path savePath = Paths.get(uploadPath);
        try {
            Files.copy(
                    file.getInputStream(),
                    savePath.resolve(filename),
                    StandardCopyOption.REPLACE_EXISTING);
            // save file info to db
            UploadFileEntity entity = new UploadFileEntity();
            entity.setSize(file.getSize());
            entity.setPath("upload/" + filename);
            repository.save(entity);

            return ResultModel.data(entity);
        } catch (IOException e) {
            return ResultModel.error("文件保存失败");
        }
    }
}