import com.hotel.pojo.entity.Permission;
import com.hotel.pojo.vo.MenuNodeVO;
import com.hotel.util.MyBeanUtils;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/12 0012
 */
public class Tests {

    @Test
    public void test1() {
        List<Permission> permissions = new ArrayList<>();
        List<MenuNodeVO> menuNodeVOs = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            permissions.add(Permission.builder()
                    .id(i)
                    .parentId(i + 1)
                    .icon(String.valueOf(i))
                    .type(String.valueOf(i))
                    .href(String.valueOf(i))
                    .title("标题" + i)
                    .permissionCode(String.valueOf(i))
                    .target(String.valueOf(i))
                    .build());
        }

        new MyBeanUtils().convertList2List(permissions, menuNodeVOs, MenuNodeVO.class);
        System.out.println(menuNodeVOs);
    }
}
