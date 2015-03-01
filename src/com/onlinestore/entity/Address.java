package com.onlinestore.entity;

/**
 * Created by zhuke on 2015/3/1.
 * 收货地址
 */
public class Address {
    private int id;
    private User user;
    private String receiverName;
    private String phoneNumber;
    private String detailAddress;
    private int postCode;//邮编

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", user=" + user +
                ", receiverName='" + receiverName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", detailAddress='" + detailAddress + '\'' +
                ", postCode=" + postCode +
                '}';
    }

    public Address() {
    }

    public Address(int id, User user, String receiverName, String phoneNumber, String detailAddress, int postCode) {
        this.id = id;
        this.user = user;
        this.receiverName = receiverName;
        this.phoneNumber = phoneNumber;
        this.detailAddress = detailAddress;
        this.postCode = postCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public int getPostCode() {
        return postCode;
    }

    public void setPostCode(int postCode) {
        this.postCode = postCode;
    }
}
