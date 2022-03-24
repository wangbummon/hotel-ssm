package com.hotel.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author az
 * @description
 * @date 2022/3/23 0023
 */
public interface FileUploadService {
    /**
     * 上传房型图片
     * @param attach 前端传来的文件
     * @return
     */
    String uploadRoomTypeImg(MultipartFile attach);

    /**
     * 上传房间图片
     * @param attach 前端传来的文件
     * @return
     */
    String uploadRoomImg(MultipartFile attach);

    /**
     * 上传房间详情图片
     * @param file 前端传来的文件
     * @return
     */
    String uploadRoomDetailImg(MultipartFile file);
}
