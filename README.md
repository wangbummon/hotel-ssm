# 酒店管理系统

## 技术选型

**环境：** JDK1.8 + MySQL8.0.26 + Tomcat9.0.59 + Tomcat10.0.17

**前端技术栈：** LayUI-Mini2.6.3 + Dtree + Echarts

**后端技术栈：** Spring + SpringMVC + MyBatis + SpringSecurity + Redis

---

## 项目结构

项目名称|介绍
---|---
**[hotel-parent](../hotel-parent)**|**父项目**
**[hotel-generator](./hotel-generator)**|**逆向工程**
**[hotel-manager](./hotel-manager)**|**后台页面及控制层代码**
**[hotel-mapper](./hotel-mapper)**|**Mapper接口与XML**
**[hotel-pojo](./hotel-pojo)**|**存放实体类及前端返回接收参数与后端返回参数**
**[hotel-service](./hotel-service)**|**存放业务层与业务实现层代码**
**[hotel-util](./hotel-util)**|**存放工具类**
**[hotel-web](./hotel-web)**|**前台页面与控制层代码**

---

## 起步

**数据库文件：[SQL](./sql/ssm_hotel.sql)**

<mark>使用前请先将 [[upload]](./upload) 文件夹放入D盘中，否则后台上传图片会报错</mark>

启动项目之前先配置一下 **[数据库连接池](./hotel-mapper/src/main/resources/db.properties)**
与 **[redis配置文件](./hotel-util/src/main/resources/jedis.properties)**

为避免tomcat冲突我使用了两个tomcat，配置如下

项目名|端口号|jmx端口号
---|---|---
**hotel-manager**|8080|1099
**hotel-desk**|8090|1100

---

> **后台账号**

账号|密码|角色
---|---|---
**admin**|**123456**|**超级管理员**
**system**|**123456**|**系统管理员**
**hotel**|**123456**|**酒店管理员**
**user**|**123456**|**普通用户**
**403**|**123456**|**403页面测试用户**