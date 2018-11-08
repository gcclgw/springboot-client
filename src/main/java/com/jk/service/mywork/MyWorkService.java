package com.jk.service.mywork;

import com.jk.model.mywork.Contxract;
import com.jk.model.mywork.Work;

import java.util.List;

public interface MyWorkService {


    List<Contxract>  queryMyWorkByTime();

    void upDhwjt(Contxract contxract);

    void upJy(Contxract contxract);

    void addText(Work work,Contxract contxract);

    void upXy(Contxract contxract);

    void upZkl(Contxract contxract);
}
