package com.github.tangyi.user.api.module;

import com.github.tangyi.common.core.persistence.BaseEntity;
import lombok.Data;

/**
 * 用户学生关联关系，一个用户可以绑定多个学生
 *
 * @author tangyi
 * @date 2019/07/09 15:23
 */
@Data
public class UserStudent extends BaseEntity<UserStudent> {

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 学生id
     */
    private Long studentId;

    /**
     * 关系类型
     */
    private Integer relationshipType;
}
