package org.example.yt;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.example.yt.service.TokenService;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


@ApplicationScoped
public class UserTable {
    
    @Inject
    TokenService tokenService;
    
    // 模拟数据存储
    private List<IUser> userTable = new ArrayList<>();
    // 模拟数据当前索引
    private int index;
    
    public UserTable() {
        // 初始化的两个用户和当前索引
        userTable.add(new IUser(1, "admin", "123456", "admin"));
        userTable.add(new IUser(2, "abc", "666666", "user"));
        index = userTable.size();
    }
    
    /**
     * 添加用户
     *
     * @param user 用户
     */
    public synchronized void addUser(IUser user) {
        index++;
        user.setId(index);
        IUser user_copy= TokenService.encryptUser(user);
        userTable.add(user_copy);
    }
    
    /**
     * 根据Id删除用户
     *
     * @param id id
     */
    public synchronized void deleteById(Integer id) {
        userTable.removeIf(student -> id.equals(student.getId()));
    }
    
    /**
     * 更新用户
     *
     * @param user 用户
     */
    public synchronized void updateUser(IUser user) {
        for (IUser source : userTable) {
            if (source.getId().equals(user.getId())) {
                IUser user_copy = TokenService.encryptUser(user);
                if (user.getUsername() != null) {
                    
                    source.setUsername(user_copy.getUsername());
                }
                if (user.getPassword() != null) {
                    source.setPassword(user_copy.getPassword());
                }
                if (user.getRole() != null) {
                    source.setRole(user.getRole());
                }
            }
        }
    }
    
    public IUser getById(Integer id) {
        return userTable.stream().filter(x -> x.getId().equals(id)).findFirst().orElse(null);
    }
    
    public IUser getByName(String username) {
        return userTable.stream().filter(x -> x.getUsername().equals(username)).findFirst().orElse(null);
    }
    
    public List<IUser> getAll() {
        return userTable;
    }
    
    @Data
    @AllArgsConstructor
    public static class IUser implements Serializable {
        // 用户Id
        private Integer id;
        // 用户名称
        private String username;
        // 用户密码
        private String password;
        // 用户角色
        private String role;
    }
    
    public List<IUser> getUserTable() {
        return userTable;
    }
    
    public void setUserTable(List<IUser> userTable) {
        this.userTable = userTable;
    }
    
    public int getIndex() {
        return index;
    }
    
    public void setIndex(int index) {
        this.index = index;
    }
    
    
    
    public static void main(String[] args) {
        UserTable cache = new UserTable();
        System.out.println("原始用户数据：" + cache.getAll());
        IUser byId = cache.getById(1);
        System.out.println("查询 id = 1 数据：" + byId);
        IUser byName = cache.getByName("ddd");
        System.out.println("查询 username = ddd 数据：" + byName);
        List<IUser> all = cache.getAll();
        System.out.println("查询所有数据：" + all);
        cache.deleteById(2);
        System.out.println("删除 id = 2 after 所有数据：" + all);
        cache.addUser(new IUser(null, "mm", "123456", "admin"));
        System.out.println("添加新用户之后所有数据：" + cache.getAll());
        cache.updateUser(new IUser(3, "xxyy", "888888", "user"));
        System.out.println("更新用户(id=3)之后所有数据：" + cache.getAll());
    }
    
}