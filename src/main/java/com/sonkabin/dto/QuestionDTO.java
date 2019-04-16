package com.sonkabin.dto;

public class QuestionDTO {
    private long rows;
    private long page;
    private String domain;
    private String sort;
    private String sortOrder = "asc";
    public static final String GMT_MODIFIED = "gmtModified";
    public static final String DOMIAN = "domain";

    public long getRows() {
        return rows;
    }

    public void setRows(long rows) {
        this.rows = rows;
    }

    public long getPage() {
        return page;
    }

    public void setPage(long page) {
        this.page = page;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
    }
}
