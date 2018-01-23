package com.gh.train.pay;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.alipay.demo.trade.config.Configs;
import com.alipay.demo.trade.model.ExtendParams;
import com.alipay.demo.trade.model.GoodsDetail;
import com.alipay.demo.trade.model.builder.AlipayTradePrecreateRequestBuilder;
import com.alipay.demo.trade.model.result.AlipayF2FPrecreateResult;
import com.alipay.demo.trade.service.AlipayTradeService;
import com.alipay.demo.trade.service.impl.AlipayTradeServiceImpl;
import com.alipay.demo.trade.utils.ZxingUtils;

public class AlibabaPayServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("生成订单，开始支付");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		if(request.getParameter("outTradeNo")!=null){
	        // 一定要在创建AlipayTradeService之前设置参数
	        Configs.init("zfbinfo.properties"); //加载沙箱配置信息到内存
	        AlipayTradeService tradeService = new AlipayTradeServiceImpl.ClientBuilder().build();

	        // (必填) 商户网站订单系统中唯一订单号，64个字符以内，只能包含字母、数字、下划线，
	        // 需保证商户系统端不能重复，建议通过数据库sequence生成，
	        String outTradeNo = request.getParameter("outTradeNo");

	        // (必填) 订单标题，粗略描述用户的支付目的。如“12306订票消费”
	        String subject = request.getParameter("subject");

	        // (必填) 订单总金额，单位为元，不能超过1亿元
	        // 如果同时传入了【打折金额】,【不可打折金额】,【订单总金额】三者,则必须满足如下条件:【订单总金额】=【打折金额】+【不可打折金额】
	        String totalAmount = request.getParameter("totalAmount");

	        // (可选) 订单不可打折金额，可以配合商家平台配置折扣活动，如果酒水不参与打折，则将对应金额填写至此字段
	        // 如果该值未传入,但传入了【订单总金额】,【打折金额】,则该值默认为【订单总金额】-【打折金额】
	        String undiscountableAmount = request.getParameter("undiscountableAmount");

	        // 卖家支付宝账号ID，用于支持一个签约账号下支持打款到不同的收款账号，(打款到sellerId对应的支付宝账号)
	        // 如果该字段为空，则默认为与支付宝签约的商户的PID，也就是appid对应的PID
	        String sellerId = "2088102169427907";//沙箱商家id

	        // 订单描述，可以对交易或商品进行一个详细地描述，比如填写"购买商品2件共15.00元"
	        String body = "购买火车票一共+"+totalAmount+"元";

	        // 商户操作员编号，添加此参数可以为商户操作员做销售统计
	        String operatorId = "test_operator_id";

	        // (必填) 商户门店编号，通过门店号和商家后台可以配置精准到门店的折扣信息，详询支付宝技术支持
	        String storeId = "test_store_id";

	        // 业务扩展参数，目前可添加由支付宝分配的系统商编号(通过setSysServiceProviderId方法)，详情请咨询支付宝技术支持
	        ExtendParams extendParams = new ExtendParams();
	        extendParams.setSysServiceProviderId("2088100200300400500");

	        // 支付超时，定义为120分钟
	        String timeoutExpress = "120m";

	        // 商品明细列表，需填写购买商品详细信息，
	        List<GoodsDetail> goodsDetailList = new ArrayList<GoodsDetail>();
	        // 创建一个商品信息，参数含义分别为商品id（使用国标）、名称、单价（单位为分）、数量，如果需要添加商品类别，详见GoodsDetail
	        GoodsDetail goods1 = GoodsDetail.newInstance("goods_id001", "全麦小面包", 1500, 1);
	        // 创建好一个商品后添加至商品明细列表
	        goodsDetailList.add(goods1);



	       // AlipayTradePrecreateContentBuilder builder = new AlipayTradePrecreateContentBuilder()
	        		
	        AlipayTradePrecreateRequestBuilder builder =new AlipayTradePrecreateRequestBuilder()
	                .setSubject(subject)
	                .setTotalAmount(totalAmount)
	                .setOutTradeNo(outTradeNo)
	                .setUndiscountableAmount(undiscountableAmount)
	                .setSellerId(sellerId)
	                .setBody(body)
	                .setOperatorId(operatorId)
	                .setStoreId(storeId)
	                .setExtendParams(extendParams)
	                .setTimeoutExpress(timeoutExpress)
	                .setNotifyUrl("http://ev18419179.iask.in/12306/AlibabaBankServlet") //支付宝服务器主动通知商户服务器里指定的页面http路径,根据需要设置
	                .setGoodsDetailList(goodsDetailList);

	        AlipayF2FPrecreateResult result = tradeService.tradePrecreate(builder);
	        switch (result.getTradeStatus()) {
	            case SUCCESS:
	                System.out.println("下单成功");

	                AlipayTradePrecreateResponse res = result.getResponse();
	                PrintWriter out = response.getWriter();
	                String basePath = request.getSession().getServletContext().getRealPath("/");
	                String fileName = String.format("images%sqr-%s.png", File.separator, res.getOutTradeNo());
	                String filePath = new StringBuilder(basePath).append(fileName).toString();
	                ZxingUtils.getQRCodeImge(res.getQrCode(), 256, filePath);
	                response.setContentType("text/html");
	                
	                request.getRequestDispatcher("alibabapay.jsp?outTradeNo="+outTradeNo+"&fileName="+fileName.replaceAll("\\\\", "/")).forward(request, response);
//	                out.println("<HTML>");
//	        		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//	        		out.println("  <BODY>");
//	        		out.println("<img src=\"" + fileName + "\" />");
//	        		out.println("  </BODY>");
//	        		out.println("</HTML>");
	               
//	        		out.flush();
//	        		out.close();
	                //response.getWriter().println("filePath:" + filePath);
	               
	                break;

	            case FAILED:
	            	System.out.println("支付宝预下单失败!!!");
	                break;

	            case UNKNOWN:
	            	System.out.println("系统异常，预下单状态未知!!!");
	                break;

	            default:
	            	System.out.println("不支持的交易状态，交易返回异常!!!");
	                break;
	        }
	        response.getWriter().println(result.getResponse().getBody());
	        return ;
	    }
	}
}
