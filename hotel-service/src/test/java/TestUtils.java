import org.springframework.beans.BeanUtils;

import java.util.Objects;
import java.util.function.Supplier;

/**
 * @author az
 * @description
 * @date 2022/3/23 0023
 */
public class TestUtils {

    public static <E, T> T test(E source, Class<T> targetClass) throws InstantiationException, IllegalAccessException {
        T target = null;
        try {
            target = targetClass.newInstance();
            BeanUtils.copyProperties(source, target);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return target;
    }
}
