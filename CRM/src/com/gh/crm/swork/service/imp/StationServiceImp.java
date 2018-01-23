package com.gh.crm.swork.service.imp;

import java.util.List;

import com.gh.crm.swork.dao.StationDao;
import com.gh.crm.swork.entity.Station;
import com.gh.crm.swork.entity.Student;
import com.gh.crm.swork.service.StationService;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class StationServiceImp implements StationService {
	private StationDao stationDao;
	public void setStationDao(StationDao stationDao) {
		this.stationDao = stationDao;
	}
	
	public PageBean<Station> findByPage(int page) {
        PageBean<Station> pageBean =new PageBean<Station>();
        pageBean.setPage(page);
        int limit=3;
        pageBean.setLimit(limit);
        
        int totalCount=stationDao.findReferCount();
        pageBean.setTotalCount(totalCount);
        //总页数
        int totalpage=(int)Math.ceil(totalCount/limit)+1;
        
        pageBean.setTotalPage(totalpage);
        //每页显示的数据集合
        int begin=(page-1)*limit;
        List<Station> list=stationDao.findByPageId(begin, limit);
        pageBean.setList(list);
        return pageBean;
    }
	
	public void addStation(Station station){
		stationDao.addStation(station);
	}
}
