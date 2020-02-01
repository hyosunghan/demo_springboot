package com.example.demo._demo;

/**
 * @author hyosunghan
 * @since 2020-02-01
 */
public class Permission {

    private static final int PERMISSION_INSERT = 1 << 0; // 1
    private static final int PERMISSION_DELETE = 1 << 1; // 2
    private static final int PERMISSION_UPDATE = 1 << 2; // 4
    private static final int PERMISSION_SELECT = 1 << 3; // 8

    private int permissions;

    private void setPermissions(int per) {
        this.permissions = per;
    }

    private int getPermissions() {
        return this.permissions;
    }

    private void enablePermissions(int per) {
        permissions = permissions | per;
    }

    private void disablePermissions(int per) {
        permissions = permissions & ~per;
    }

    private boolean isAllow(int per) {
        return (permissions & per) == per;
    }

    private boolean isNotAllow(int per) {
        return (permissions & per) == 0;
    }

    public static void main(String[] args) {
        Permission permission = new Permission();
        permission.setPermissions(PERMISSION_INSERT | PERMISSION_DELETE | PERMISSION_UPDATE | PERMISSION_SELECT);
        System.out.println(Integer.toBinaryString(permission.getPermissions()));
        permission.disablePermissions(PERMISSION_INSERT | PERMISSION_DELETE);
        System.out.println(Integer.toBinaryString(permission.getPermissions()));
        permission.enablePermissions(PERMISSION_INSERT);
        System.out.println(Integer.toBinaryString(permission.getPermissions()));
        System.out.println(permission.isAllow(PERMISSION_INSERT));
        System.out.println(permission.isNotAllow(PERMISSION_INSERT));
    }
}
