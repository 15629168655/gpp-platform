package com.tbyf.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
/**
 * 修改时间：2015、12、11
 */
@Repository("daoSupport")
public class DaoSupport implements DAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 保存对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object save(String str, Object obj) throws Exception {
		return sqlSessionTemplate.insert(str, obj);
	}
	
	/**
	 * 批量保存
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object batchSave(String str, List objs )throws Exception{
		return sqlSessionTemplate.insert(str, objs);
	}
	
	/**
	 * 修改对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object update(String str, Object obj) throws Exception {
		return sqlSessionTemplate.update(str, obj);
	}

	
/*	public  Object produ(String str, Object obj) throws Exception {
		PageData pd = (PageData)sqlSessionTemplate.
				selectOne(str, obj);
		Map<?, ?>  map=(Map<?, ?>)sqlSessionTemplate.selectOne(str, obj);
		return map;
	}
	*/
	
/*	public  Map test(String str, Object obj) throws Exception {
		
	    String resource = "ApplicationContext-mvc.xml";
        Reader reader = Resources.getResourceAsReader(resource);
        SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
        SqlSession sqlsessiontemplate = ssf.openSession();
	    Map<String, String> param = new HashMap<String, String>();
        param.put("p_user_name", "zhangsan");
        String returnValue = (String)sqlsessiontemplate.selectOne("SfjlHypertensionMapper.test", param);
        System.out.println("message=" + param.get("p_user_name"));
        System.out.println("result=" + param.get("result"));
        System.out.println("returnValue=" + returnValue);
		return param;
	}
	*/

	

	/**
	 * 批量更新
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public void batchUpdate(String str, List objs )throws Exception{
		SqlSessionFactory sqlSessionFactory = sqlSessionTemplate.getSqlSessionFactory();
		//批量执行器
		SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH,false);
		try{
			if(objs!=null){
				for(int i=0,size=objs.size();i<size;i++){
					sqlSession.update(str, objs.get(i));
				}
				sqlSession.flushStatements();
				sqlSession.commit();
				sqlSession.clearCache();
			}
		}finally{
			sqlSession.close();
		}
	}
	
	/**
	 * 批量删除
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object batchDelete(String str, List objs )throws Exception{
		return sqlSessionTemplate.delete(str, objs);
	}
	
	/**
	 * 删除对象 
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object delete(String str, Object obj) throws Exception {
		return sqlSessionTemplate.delete(str, obj);
	}
	 
	/**
	 * 查找对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object findForObject(String str, Object obj) throws Exception {
		return sqlSessionTemplate.selectOne(str, obj);
	}

	/**
	 * 查找对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object findForList(String str, Object obj) throws Exception {
		return sqlSessionTemplate.selectList(str, obj);
	}
	
	public Object findForMap(String str, Object obj, String key) throws Exception {
		return sqlSessionTemplate.selectMap(str, obj, key);
	}
	/**
     * 批量提交数据
     * @param mybatisSQLId SQL语句在Mapper XML文件中的ID
     * @param commitCountEveryTime 每次提交的记录数
     * @param list 要提交的数据列表
     */
	public <T> void batchCommit(String mybatisSQLId, int commitCountEveryTime, 
    		List<T> list) {
    	SqlSessionFactory sqlSessionFactory = sqlSessionTemplate.getSqlSessionFactory();
        SqlSession session = null;
        try {
            session = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
            int commitCount = (int) Math.ceil(list.size() / (double) commitCountEveryTime);
            List<T> tempList = new ArrayList<T>(commitCountEveryTime);
            int start, stop;
            Long startTime = System.currentTimeMillis();
            for (int i = 0; i < commitCount; i++) {
                tempList.clear();
                start = i * commitCountEveryTime;
                stop = Math.min(i * commitCountEveryTime + commitCountEveryTime - 1, list.size() - 1);
                for (int j = start; j <= stop; j++) {
                    tempList.add(list.get(j));
                }
                session.insert(mybatisSQLId, tempList);
                session.commit();
                session.clearCache();
                System.out.println("批量提交处理：第" + i + "次提交");
            }
            Long endTime = System.currentTimeMillis();
            System.out.println("batchCommit耗时：" + (endTime - startTime) + "毫秒");
        } catch (Exception e) {
            //logger.error("batchCommit error!", e);
            e.printStackTrace();
            session.rollback();
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
	
}


