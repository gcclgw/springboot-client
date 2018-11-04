package com.jk.utils;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONObject;

public class HttpUtils {
    static CloseableHttpClient client = null;
    static {
        client = HttpClients.createDefault();
    }

    /**
     *
     * 方法: get <br>
     * 描述: get请求 <br>
     * 作者: Teacher song<br>
     * 时间: 2017年7月21日 下午3:15:25
     * @param url
     * @param params
     * @return
     * @throws Exception
     */
    public static String get(String url,HashMap<String, Object> params){
        try {
            HttpGet httpGet = new HttpGet();
            Set<String> keySet = params.keySet();
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append(url).append("?t=").append(System.currentTimeMillis());
            for (String key : keySet) {
                stringBuffer.append("&").append(key).append("=").append(params.get(key));
            }
            httpGet.setURI(new URI(stringBuffer.toString()));
            CloseableHttpResponse execute = client.execute(httpGet);
            int statusCode = execute.getStatusLine().getStatusCode();
            if (200 != statusCode) {
                return "";
            }
            return EntityUtils.toString(execute.getEntity(), "utf-8");
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    /**
     *
     * 方法: post <br>
     * 描述: post请求 <br>
     * 作者: Teacher song<br>
     * 时间: 2017年7月21日 下午3:20:31
     * @param url
     * @param params
     * @return
     * @throws Exception
     */
    public static String post(String url,HashMap<String, Object> params) {
        try {
            HttpPost httpPost = new HttpPost();
            httpPost.setURI(new URI(url));
            List<NameValuePair> parameters = new ArrayList<NameValuePair>();
            Set<String> keySet = params.keySet();
            for (String key : keySet) {
                NameValuePair e = new BasicNameValuePair(key, params.get(key).toString());
                parameters.add(e);
            }
            HttpEntity entity = new UrlEncodedFormEntity(parameters , "utf-8");
            httpPost.setEntity(entity );
            CloseableHttpResponse execute = client.execute(httpPost);
            int statusCode = execute.getStatusLine().getStatusCode();
            if (200 != statusCode) {
                return "";
            }
            return EntityUtils.toString(execute.getEntity(), "utf-8");
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    public static String doGet(String url, Map<String, String> param) {

        // 创建Httpclient对象
        CloseableHttpClient httpclient = HttpClients.createDefault();

        String resultString = "";
        CloseableHttpResponse response = null;
        try {
            // 创建uri
            URIBuilder builder = new URIBuilder(url);
            if (param != null) {
                for (String key : param.keySet()) {
                    builder.addParameter(key, param.get(key));
                }
            }
            URI uri = builder.build();

            // 创建http GET请求
            HttpGet httpGet = new HttpGet(uri);

            // 执行请求
            response = httpclient.execute(httpGet);
            // 判断返回状态是否为200
            if (response.getStatusLine().getStatusCode() == 200) {

                resultString = EntityUtils.toString(response.getEntity(), "UTF-8");

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (response != null) {
                    response.close();
                }
                httpclient.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return resultString;
    }

    public static String doGet(String url) {
        return doGet(url, null);
    }
    public static void main(String[] args) {
        HashMap<String, Object> params = new HashMap<String, Object>();
        params.put("city", "北京");
        String string = HttpUtils.get("https://www.sojson.com/open/api/weather/json.shtml", params);
        System.out.println(string);
    }
    }



