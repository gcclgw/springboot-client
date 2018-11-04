package com.jk.service.adver;

import com.jk.model.adver.Adver;
import com.jk.utils.ResultPage;

public interface AdverService {
    ResultPage selectAdverList(Adver adver);

    void addAdver(Adver adver);
}
