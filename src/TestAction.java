import org.apache.struts2.dispatcher.DefaultActionSupport;

/**
 * Created by zhuke on 2015/2/9.
 */
public class TestAction extends DefaultActionSupport {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @Override
    public String execute() throws Exception {
        System.out.println(name);
        return SUCCESS;
    }
}
