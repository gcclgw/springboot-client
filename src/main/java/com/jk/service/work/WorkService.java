package com.jk.service.work;

import com.jk.model.work.Work;

import java.util.List;

public interface WorkService {
    void addWork(Integer htid);
    List<Work> queryWork();
    void updateWork(Work work);
    void updateContXy(Integer htid);
    void updateContJy(Integer htid);
}
