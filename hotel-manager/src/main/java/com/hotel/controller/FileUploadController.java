package com.hotel.controller;

import com.hotel.service.FileUploadService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author az
 * @description
 * @date 2022/3/23 0023
 */
@Api("统一文件上传")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class FileUploadController {

    private final FileUploadService uploadService;

    @ApiOperation("房型图片上传")
    @PostMapping("/roomTypeImg")
    public String uploadRoomTypeImg(MultipartFile attach){
        return uploadService.uploadRoomTypeImg(attach);
    }

    @ApiOperation("房间图片上传")
    @PostMapping("/roomImg")
    public String uploadRoomImg(MultipartFile attach){
        return uploadService.uploadRoomImg(attach);
    }

    @ApiOperation("房间详情图片上传")
    @PostMapping("/roomDetailImg")
    public String uploadRoomDetailImg(MultipartFile file){
        return uploadService.uploadRoomDetailImg(file);
    }
}
