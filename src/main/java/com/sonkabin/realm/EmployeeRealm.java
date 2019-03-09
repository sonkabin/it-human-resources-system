package com.sonkabin.realm;

import com.sonkabin.entity.Employee;
import com.sonkabin.service.EmployeeService;
import com.sonkabin.service.PermissionService;
import com.sonkabin.utils.MD5Util;
import com.sonkabin.utils.MyUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class EmployeeRealm extends AuthorizingRealm {

    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private PermissionService permissionService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        /*
        每次遇到权限认证都会调用，若想提高效率，需要使用缓存
         */
        Integer roleId = MyUtil.getSessionEmployee("loginEmp").getRoleId(); // 得到登录用户的角色id
        List<String> permissions = permissionService.getPermissions(roleId);
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.addStringPermissions(permissions);
        return authorizationInfo;
    }

    /**
     * 验证当前登录的Subject
     * 执行Subject的login()方法时 执行此方法
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // 强转为UsernamePasswordToken
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        // 此empId对应于数据库表中的自增id
        String empId = usernamePasswordToken.getUsername();
        String password = new String(usernamePasswordToken.getPassword());

        ByteSource salt = ByteSource.Util.bytes(empId); // 盐值
        String pwd = MD5Util.calculatePwd(password, empId);
        Employee employee = employeeService.selectOne(empId ,pwd);
        if(employee == null){
            throw new AuthenticationException();
        }
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(empId,pwd,salt,getName());
        SecurityUtils.getSubject().getSession().setAttribute("loginEmp", employee);
        return authenticationInfo;
    }
}
