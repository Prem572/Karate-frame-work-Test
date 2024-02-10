package com.org.karate.java;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.file.Path;

public class HTTPChecks {

    public static void main(String[] args) throws Exception{
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder().
                                uri(new URI("http://localhost:9897/normal/webapi/all")).
                                GET().build();
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println("Response code=>"+response.statusCode());
        System.out.println("Response body=>"+response.body());

        JSONObject object = new JSONObject();
        object.put("jobId", Integer.parseInt(RandomStringUtils.randomNumeric(2)));
        object.put("jobTitle", RandomStringUtils.randomAlphabetic(10));
        object.put("jobTitle", RandomStringUtils.randomAlphabetic(10));
        object.put("jobDescription", RandomStringUtils.randomAlphabetic(10));
        object.put("experience", new JSONArray().put("AAA").put("BBB"));

        JSONObject object2 = new JSONObject();
        object2.put("projectName","Tesco");
        object2.put("technology",new JSONArray().put("JAVA").put("HTTPCLIENT"));
        object.put("project", new JSONArray().put(object2));

        System.out.println(object);
        HttpRequest postBodyRequest = HttpRequest.newBuilder().
                                        POST(HttpRequest.BodyPublishers.ofString(object.toString())).
                                        header("Content-Type","application/json")
                                        .uri(new URI("http://localhost:9897/normal/webapi/add")).build();
        HttpResponse<String> httpResponse = client.send(postBodyRequest,HttpResponse.BodyHandlers.ofString());
        System.out.println(httpResponse.statusCode() + "\n" + httpResponse.body());

        //File Upload check
//        HttpPost post = new HttpPost("http://localhost:9897/normal/webapi/upload");
//        post.setHeader("Content-Type","multipart/form-data");
//        post.setEntity(MultipartEntityBuilder.create().
//                addPart("file",new FileBody(new File("C:/Users/HP/IdeaProjects/Karate_Testing/src/test/java/com/org/karate/documents/Deepshikha Pandey.pdf")))
//                .build());
//        CloseableHttpClient cl = HttpClients.createDefault();
//        CloseableHttpResponse res =  cl.execute(post);
//        System.out.println("Upload Status "+res.getStatusLine().toString());

        request = HttpRequest.newBuilder()
                .uri(new URI("http://localhost:9897/normal/webapi/upload"))
                .header("Content-Type","multipart/form-data")
                .POST(HttpRequest.BodyPublishers.ofFile(Path.of("C:/Users/HP/IdeaProjects/Karate_Testing/src/test/java/com/org/karate/documents/Deepshikha Pandey.pdf")))
                .build();
        response = client.send(request,HttpResponse.BodyHandlers.ofString());
        System.out.println("Uload status==>"+response.statusCode());
    }
}
