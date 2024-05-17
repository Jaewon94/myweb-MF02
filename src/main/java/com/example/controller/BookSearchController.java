package com.example.controller;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
public class BookSearchController {

    private final String apiKey = "c7d59348bfe22e5c8c9299f8d7a711ba";

    @GetMapping("/search/books")
    public ResponseEntity<String> searchBooks(String title) {

        // kakao Book Search Open API URL

        final String url = "https://dapi.kakao.com/v3/search/book?query="+title;

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK " + apiKey);
//        headers.setContentType(MediaType.APPLICATION_JSON_UTF8);

        HttpEntity<String> entity = new HttpEntity<String>(headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);

        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON_UTF8).body(response.getBody());

    }
}
