package com.onlinestore.action;

import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.stereotype.Controller;

import java.io.*;
import java.util.List;

@Controller
public class FileUploadAction extends DefaultActionSupport {

    //注意，file并不是指前端jsp上传过来的文件本身，而是文件上传过来存放在临时文件夹下面的文件
    private List<File> files;

    //提交过来的file的名字
    private List<String> filesFileName;

    //提交过来的file的MIME类型
    private List<String> filesContentType;

    public List<File> getFiles() {
        return files;
    }

    public void setFiles(List<File> files) {
        this.files = files;
    }

    public List<String> getFilesFileName() {
        return filesFileName;
    }

    public void setFilesFileName(List<String> filesFileName) {
        this.filesFileName = filesFileName;
    }

    public List<String> getFilesContentType() {
        return filesContentType;
    }

    public void setFilesContentType(List<String> filesContentType) {
        this.filesContentType = filesContentType;
    }

    @Override
    public String execute() throws Exception {

        for (int i = 0; i < filesFileName.size(); i++) {
            String savePath =  ServletActionContext.getServletContext().getRealPath("/")+"upload/"+ ActionContext.getContext().getSession().get("lg_id");
            InputStream is = new FileInputStream(files.get(i));
            File f = new File(savePath);
            if (!f.exists()) {
                f.mkdirs();
            }
            savePath = savePath + "/"+filesFileName.get(i);
            FileOutputStream fos = new FileOutputStream(savePath);
            byte[] buf = new byte[1024];
            int len = 0;
            while ((len = is.read(buf)) > 0) {
                fos.write(buf, 0, len);
            }
            fos.flush();
        }
        return SUCCESS;
    }
}