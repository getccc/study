package com.gh.train.util;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Map;

import com.sun.org.apache.commons.beanutils.BeanUtils;
import com.sun.org.apache.commons.beanutils.ConvertUtils;
import com.sun.org.apache.commons.beanutils.locale.converters.DateLocaleConverter;
/**
 * 
 * @author CaiJianWei
 *
 * 2017-9-11
 */
public class CommonUtils {
	public static <T> T toBean (Class<T> clazz ,Map map){
		try {
			T bean = clazz.newInstance();
			
			ConvertUtils.register(new DateLocaleConverter(), Date.class);
			try {
				BeanUtils.populate(bean, map);
				
				return bean;
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
		
	}
}
