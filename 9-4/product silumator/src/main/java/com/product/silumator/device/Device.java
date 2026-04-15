package com.product.core.entity;

/**
 * Lớp Entity đại diện cho một Thiết bị (Device).
 * Được thiết kế dựa trên cấu trúc (POJO) tương tự như các file Product, User.
 */
public class Device {
    
    private String id;
    private String deviceName;
    private String type;        // Ví dụ: Mobile, Tablet, ATM,...
    private String status;      // Ví dụ: Active, Inactive, Maintenance

    public Device() {
    }

    public Device(String id, String deviceName, String type, String status) {
        this.id = id;
        this.deviceName = deviceName;
        this.type = type;
        this.status = status;
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Phương thức mô phỏng một hành động cơ bản của entity (như calculateTotal của Order)
    public void activateDevice() {
        this.status = "Active";
    }
}
