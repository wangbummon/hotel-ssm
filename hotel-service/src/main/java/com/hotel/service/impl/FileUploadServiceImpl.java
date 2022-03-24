package com.hotel.service.impl;

import com.alibaba.fastjson.JSON;
import com.hotel.service.FileUploadService;
import com.hotel.util.UUIDUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @author az
 * @description
 * @date 2022/3/23 0023
 */
@Service
@Transactional
public class FileUploadServiceImpl implements FileUploadService {

    /**
     * 上传文件
     *
     * @param attach 前端传来的文件
     * @return
     */
    @Override
    public String uploadRoomTypeImg(MultipartFile attach) {
        //保存layui识别的json数据的map集合
        Map<String, Object> map = new HashMap<>();
        //存放data数据
        Map<String, Object> dataMap = new HashMap<>();
        //判断文件是否为空
        if (!attach.isEmpty()) {
            //指定文件上传路径
            String path = "D:\\upload\\roomType\\";
            //获取原文件名
            String oldName = attach.getOriginalFilename();
            //获取文件后缀名.
            String extension = Objects.requireNonNull(oldName).substring(oldName.lastIndexOf("."));
            //为了去重利用UUDID生成新的文件名
            String newName = UUIDUtils.randomUUID() + extension;
            //利用日期作为文件夹管理文件
            String datePath = new SimpleDateFormat("yyyyMMdd").format(new Date());
            //组装最终的文件名
            String finalName = datePath + "/" + newName;
            //创建文件对象
            File dest = new File(path, finalName);
            //判断文件夹是否存在 不存在则自动创建
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            try {
                //数据上传成功后的回显地址
                dataMap.put("src", "/hotel/show/roomType/" + finalName);
                attach.transferTo(dest);
                map.put("code", 0);
                map.put("msg", "上传成功");
                map.put("data", dataMap);
                //文件名 为了给前端photo设置隐藏域的值
                map.put("imagePath", finalName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return JSON.toJSONString(map);
    }

    /**
     * 上传房间图片
     *
     * @param attach 前端传来的文件
     * @return
     */
    @Override
    public String uploadRoomImg(MultipartFile attach) {
        //保存layui识别的json数据的map集合
        Map<String, Object> map = new HashMap<>();
        //存放data数据
        Map<String, Object> dataMap = new HashMap<>();
        //判断文件是否为空
        if (!attach.isEmpty()) {
            //指定文件上传路径
            String path = "D:\\upload\\room\\main\\";
            //获取原文件名
            String oldName = attach.getOriginalFilename();
            //获取文件后缀名.
            String extension = Objects.requireNonNull(oldName).substring(oldName.lastIndexOf("."));
            //为了去重利用UUDID生成新的文件名
            String newName = UUIDUtils.randomUUID() + extension;
            //利用日期作为文件夹管理文件
            String datePath = new SimpleDateFormat("yyyyMMdd").format(new Date());
            //组装最终的文件名
            String finalName = datePath + "/" + newName;
            //创建文件对象
            File dest = new File(path, finalName);
            //判断文件夹是否存在 不存在则自动创建
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            try {
                //数据上传成功后的回显地址
                dataMap.put("src", "/hotel/show/room/main/" + finalName);
                attach.transferTo(dest);
                map.put("code", 0);
                map.put("msg", "上传成功");
                map.put("data", dataMap);
                //文件名 为了给前端photo设置隐藏域的值
                map.put("imagePath", finalName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return JSON.toJSONString(map);
    }

    @Override
    public String uploadRoomDetailImg(MultipartFile file) {
        //保存layui识别的json数据的map集合
        Map<String, Object> map = new HashMap<>();
        //存放data数据
        Map<String, Object> dataMap = new HashMap<>();
        //判断文件是否为空
        if (!file.isEmpty()) {
            //指定文件上传路径
            String path = "D:\\upload\\room\\detail\\";
            //获取原文件名
            String oldName = file.getOriginalFilename();
            //获取文件后缀名.
            String extension = Objects.requireNonNull(oldName).substring(oldName.lastIndexOf("."));
            //为了去重利用UUDID生成新的文件名
            String newName = UUIDUtils.randomUUID() + extension;
            //利用日期作为文件夹管理文件
            String datePath = new SimpleDateFormat("yyyyMMdd").format(new Date());
            //组装最终的文件名
            String finalName = datePath + "/" + newName;
            //创建文件对象
            File dest = new File(path, finalName);
            //判断文件夹是否存在 不存在则自动创建
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            try {
                //数据上传成功后的回显地址
                dataMap.put("src", "/hotel/show/room/detail/" + finalName);
                file.transferTo(dest);
                map.put("code", 0);
                map.put("msg", "上传成功");
                map.put("data", dataMap);
                //文件名 为了给前端photo设置隐藏域的值
                map.put("imagePath", finalName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return JSON.toJSONString(map);
    }
}
