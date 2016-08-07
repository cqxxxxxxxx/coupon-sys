package cn.xiaohuodui.form;

/**
 * Created by cqxxxxx on 2016/8/5.
 */
public class AdminLoginForm {
    private String username;
    private String password;
    private boolean remember;
    private int root;

    public String getUsername() { return username;}

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isRemember() {
        return remember;
    }

    public void setRemember(boolean remember) {
        this.remember = remember;
    }

    public int getRoot() {
        return root;
    }

    public void setRoot(int root) {
        this.root = root;
    }


}
