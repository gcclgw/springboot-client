package com.jk.controller.timing;


import com.jk.model.mywork.Contxract;
import com.jk.service.timing.TimingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.*;

//编写定时任务类
@Component
public class timingController {


    @Autowired
     private TimingService timingService;

    //项目启动就开始执行
    //"秒 分 时 * * ? "  规定在什么时间执行
    /*@Scheduled(cron = "0 40 21 * * ? ")
    public void timerRate() {

        timingSMS();

    }*/



    public  void  timingSMS() {
        List<Contxract> contxract = timingService.queryHtPhone();
        Date date = new Date();
        if(contxract!=null && !"".equals(contxract)){
            for (int i = 0; i < contxract.size(); i++) {
                long   time=((contxract.get(i).getEndtime().getTime())-(date.getTime())) / (1000*3600*24);
                if(time==15 || time==13 || time==11 || time==9 || time==7 ){
                    System.out.println(contxract.get(i).getHtphone());


                }
            }
        }

      /*  if (contxract!=null ){
            for (int i = 0 ; i<contxract.size();i++){
                String endtime = contxract.get(i).getEndtime();
                Date parse = sdf.parse(endtime);
                long date  =  (parse.getTime()-time.getTime())/1000/3600/24;
                date=date+1;
                if (date==30 ){
                    IndustrySMS.execute("13146789257");
                    System.out.println(111);
                }if (date == 5 ){
                    workService.addWork(contxes.get(i).getHtid());
                }
                System.out.println(date);

            }
        }*/

    }




}
