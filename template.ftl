<#assign
    blogEntries = restClient.get("/headless-delivery/v1.0/sites/${groupId}/blog-postings?sort=dateCreated:asc").items
/>

<div class="widget-mode-simple">
    <div class="container">
        <div class="col-md-8 mx-auto">
            <#if blogEntries?has_content>
                <#list blogEntries as curBlogEntry>
                    <div class="widget-mode-simple-entry">
                        <div class="autofit-padded-no-gutters-x autofit-row widget-topbar">
                            <div class="autofit-col">
                                <@liferay_ui["user-portrait"]
                                    cssClass="user-icon-lg"
                                    userId=curBlogEntry.creator.id
                                    userName=curBlogEntry.creator.name
                                />
                            </div>

                            <div class="autofit-col autofit-col-expand">
                                <div class="autofit-row">
                                    <div class="autofit-col autofit-col-expand">
                                        <#assign
                                            viewEntryURL = themeDisplay.getPathMain() +
                                            "/blogs/find_entry?p_l_id=" + themeDisplay.getPlid() +
                                            "&entryId=" + curBlogEntry.id
                                        />
                                        <h3 class="title">
                                            <a
                                                class="title-link"
                                                href="${viewEntryURL}">${htmlUtil.escape(curBlogEntry.headline)}
                                            </a>
                                        </h3>
                                    </div>
                                </div>

                                <div class="autofit-row widget-metadata">
                                    <div class="autofit-col autofit-col-expand">
                                        <div class="autofit-row">
                                            <div class="autofit-col autofit-col-expand">
                                                <small>
                                                    <strong>${curBlogEntry.creator.name}</strong>
                                                </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            </#if>
        </div>
    </div>
</div>