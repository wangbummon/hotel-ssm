package com.hotel.pojo.po;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.hotel.pojo.entity.Account;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author az
 * @description
 * @date 2022/3/25 0025
 */
@EqualsAndHashCode(callSuper = true)
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class AccountPO extends Account {

}
