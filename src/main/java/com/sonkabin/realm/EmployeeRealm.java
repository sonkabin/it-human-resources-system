package com.sonkabin.realm;

import com.sonkabin.entity.Employee;
import com.sonkabin.service.EmployeeService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

public class EmployeeRealm extends AuthorizingRealm {

    @Autowired
    private EmployeeService employeeService;
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
    }

    /**
     * 验证当前登录的Subject
     * 执行Subject的login()方法时 执行此方法
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //强转为UsernamePasswordToken
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        String empId = usernamePasswordToken.getUsername();
        String password = new String(usernamePasswordToken.getPassword());
        //MD5加密
        String hashAlgorithmName = "MD5";
        ByteSource salt = ByteSource.Util.bytes(empId);//盐值
        int hashIterations = 1024;
        SimpleHash simpleHash  = new SimpleHash(hashAlgorithmName, password, salt, hashIterations);
        String pwd = simpleHash.toString();

        Employee employee = employeeService.selectOne(empId,pwd);
        if(employee == null){
            throw new AuthenticationException();
        }

        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(empId,pwd,salt,getName());
        SecurityUtils.getSubject().getSession().setAttribute("loginEmp", employee);
        return authenticationInfo;
    }
}
