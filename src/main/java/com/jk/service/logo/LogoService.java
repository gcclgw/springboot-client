package com.jk.service.logo;

import com.jk.model.logo.Logo;

import java.util.List;

public interface LogoService {
    List<Logo> queryLogo();
    void updateLogo(Logo logo);


}
