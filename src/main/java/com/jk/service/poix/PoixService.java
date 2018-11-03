package com.jk.service.poix;

import com.jk.model.cont.Contx;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface PoixService {
    List<Contx> selectUsers(String htid);

    boolean batchImport(String fileName, MultipartFile file);
}
