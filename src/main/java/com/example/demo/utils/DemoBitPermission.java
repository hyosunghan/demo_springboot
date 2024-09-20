package com.example.demo.utils;

public class DemoBitPermission {
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
        DemoBitPermission demoBitPermission = new DemoBitPermission();
        demoBitPermission.setPermissions(PERMISSION_INSERT | PERMISSION_DELETE | PERMISSION_UPDATE | PERMISSION_SELECT);
        System.out.println(Integer.toBinaryString(demoBitPermission.getPermissions()));
        demoBitPermission.disablePermissions(PERMISSION_INSERT | PERMISSION_DELETE);
        System.out.println(Integer.toBinaryString(demoBitPermission.getPermissions()));
        demoBitPermission.enablePermissions(PERMISSION_INSERT);
        System.out.println(Integer.toBinaryString(demoBitPermission.getPermissions()));
        System.out.println(demoBitPermission.isAllow(PERMISSION_INSERT));
        System.out.println(demoBitPermission.isNotAllow(PERMISSION_INSERT));
    }
}
