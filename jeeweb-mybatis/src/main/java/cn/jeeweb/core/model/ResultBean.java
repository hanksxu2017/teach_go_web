package cn.jeeweb.core.model;

import cn.jeeweb.core.utils.StringUtils;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResultBean {

    private String resCode;

    private String message;

    private Object data;

    public static ResultBean FAILED(String message) {
        ResultBean resultBean = new ResultBean();
        resultBean.setResCode("-1");
        resultBean.setMessage(message);
        return resultBean;
    }

    public static ResultBean SUCCESS() {
        ResultBean resultBean = new ResultBean();
        resultBean.setResCode("0");
        resultBean.setMessage("success");
        return resultBean;
    }

    public boolean isSuccess() {
        return StringUtils.equals(this.resCode, "0");
    }
}
