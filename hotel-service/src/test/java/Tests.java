import com.hotel.pojo.entity.Floor;
import com.hotel.pojo.entity.Permission;
import com.hotel.pojo.entity.Role;
import com.hotel.pojo.po.FloorPO;
import com.hotel.pojo.po.RolePO;
import com.hotel.pojo.vo.MenuNodeVO;
import com.hotel.pojo.vo.RoleVO;
import com.hotel.util.MyBeanUtils;
import com.hotel.util.UUIDUtils;
import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.stream.Collectors;

/**
 * @author az
 * @description
 * @date 2022/3/12 0012
 */
public class Tests {

    @Test
    public void test1() throws IOException {
        System.out.println(new BCryptPasswordEncoder().encode("123456"));
    }


}
