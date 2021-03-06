package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.modules.sys.entity.DictGroup;
import cn.jeeweb.modules.sys.mapper.DictGroupMapper;
import cn.jeeweb.modules.sys.service.IDictGroupService;

import com.baomidou.mybatisplus.mapper.Wrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("dictGroupService")
public class DictGroupServiceImpl extends CommonServiceImpl<DictGroupMapper,DictGroup> implements IDictGroupService {



    @Override
    public DictGroup selectOne(Wrapper<DictGroup> wrapper) {
        return super.selectOne(wrapper);
    }
}
