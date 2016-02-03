package com.hesc.group.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;



@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
        "classpath:spring-activiti.xml",
        "classpath:spring-mvc.xml",
        "classpath:spring-mybatis.xml",
        "classpath:spring.xml" })
public class TestController2 {
    @Autowired
    private WebApplicationContext webApplicationContext;
    private MockMvc mockMvc;
    @Before
    public void init(){
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }
    @Test
    public void printBeans(){
        String[] beans=webApplicationContext.getBeanDefinitionNames();
        for (String bean : beans) {
            System.out.println(bean);
        }
    }
    /*测试以普通请求参数发送的请求*/
    @Test
    public void testSave() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.put("/group/usergroup/zybmTree").param("id", "root"));
    }
    /*@Test  
    //有些单元测试你不希望回滚  
    @Rollback(false)  
  public void testInsert() throws Exception {  
      mockMvc.perform((post("/insertTest"))).andExpect(status().isOk())  
              .andDo(print());  
  } */
}