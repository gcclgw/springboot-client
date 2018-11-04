package com.jk.service.bers;

import com.jk.model.mans.Userx;

import java.util.List;

public interface BersService {
    List<Userx> bersSelect();

    void delDers(String uid);

    Userx updateBers(String uid);

    void updateAdds(Userx u);

    List<Userx> memSelect();

    void updateMen(String uid);
}
