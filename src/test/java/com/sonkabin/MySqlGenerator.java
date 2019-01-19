package com.sonkabin;

import com.baomidou.mybatisplus.core.exceptions.MybatisPlusException;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

@SuppressWarnings(value = "nocheck")
public class MySqlGenerator {

    /**
     * <p>
     * 读取控制台内容
     * </p>
     */
    public static String scanner(String tip) {
        Scanner scanner = new Scanner(System.in);
        StringBuilder help = new StringBuilder();
        help.append("请输入" + tip + "：");
        System.out.println(help.toString());
        if (scanner.hasNext()) {
            String ipt = scanner.next();
            if (StringUtils.isNotEmpty(ipt)) {
                return ipt;
            }
        }
        throw new MybatisPlusException("请输入正确的" + tip + "！");
    }

    public static void main(String[] args) {
        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();

        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        String projectPath = System.getProperty("user.dir");
        gc.setOutputDir(projectPath + "/src/main/java");//生成文件的输出目录
        gc.setAuthor("sonkabin");//开发人员
        gc.setOpen(false);
        gc.setEnableCache(false);// XML 二级缓存
        gc.setServiceName("%sService");
        gc.setFileOverride(false);
//        gc.setActiveRecord(false);//3.0版本默认关闭AR模式
//        gc.setDateType();3.0版本的TIME_PACK是Java8下的LocalDateTime和LocalDate
        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl("jdbc:mysql://localhost:3306/db_it_human_resources?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC");
        // dsc.setSchemaName("public");
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("sunjiamin");
        mpg.setDataSource(dsc);

        // 包配置
        PackageConfig pc = new PackageConfig();
//        pc.setModuleName(scanner("模块名"));
//        pc.setController("controller");//3.0变成controller
        pc.setParent("com.sonkabin");//没有找到一个好方法能直接生成在resources的mapper文件夹下
        mpg.setPackageInfo(pc);

        // 自定义配置
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
            }
        };
        // 如果模板引擎是 velocity
        String templatePath = "/templates/mapper.xml.vm";
        // 自定义输出配置
        List<FileOutConfig> focList = new ArrayList<>();
        // 自定义配置会被优先输出
        focList.add(new FileOutConfig(templatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输出文件名
                return projectPath + "/src/main/resources/mapper/"
                        + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
            }

        });
        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);

        //配置自定义输出模板
        TemplateConfig tc = new TemplateConfig();
        tc.setController("/mytemplates/controller.java");
        tc.setService("/mytemplates/service.java");
        tc.setServiceImpl("/mytemplates/serviceImpl.java");
        tc.setXml(null);//不让其同时在mapper包下生成xml文件
        mpg.setTemplate(tc);

        // 策略配置，数据库表配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        strategy.setTablePrefix("tb_");
        strategy.setRestControllerStyle(false);

        strategy.setExclude(null);
//        strategy.setInclude("user");


//        strategy.setSuperServiceClass("com.sonkabin.service.Service");
//        strategy.setSuperEntityClass("com.baomidou.ant.common.BaseEntity");
//        strategy.setEntityLombokModel(true);
//        strategy.setSuperControllerClass("com.baomidou.ant.common.BaseController");
//        strategy.setInclude(scanner("表名"));
//        strategy.setSuperEntityColumns("id");
//        strategy.setControllerMappingHyphenStyle(true);
//        strategy.setTablePrefix(pc.getModuleName() + "_");
        mpg.setStrategy(strategy);
        mpg.execute();
    }
}
