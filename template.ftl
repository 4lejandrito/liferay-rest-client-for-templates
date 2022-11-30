<#assign
    entriesQueryDefinition = objectUtil("com.liferay.portal.kernel.dao.orm.QueryDefinition")
    blogsEntryLocalService = serviceLocator.findService(
        "com.liferay.blogs.service.BlogsEntryLocalService"
    )
/>
${entriesQueryDefinition.setStart(getterUtil.getInteger(-1))}
${entriesQueryDefinition.setEnd(getterUtil.getInteger(-1))}
${entriesQueryDefinition.setStatus(getterUtil.getInteger(0))}
<#assign
    blogEntries = blogsEntryLocalService.getGroupEntries(groupId, entriesQueryDefinition)
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
                                    userId=curBlogEntry.userId
                                    userName=curBlogEntry.userName
                                />
                            </div>

                            <div class="autofit-col autofit-col-expand">
                                <div class="autofit-row">
                                    <div class="autofit-col autofit-col-expand">
                                        <#assign
                                            viewEntryURL = themeDisplay.getPathMain() +
                                            "/blogs/find_entry?p_l_id=" + themeDisplay.getPlid() +
                                            "&entryId=" + curBlogEntry.getEntryId()
                                        />
                                        <h3 class="title">
                                            <a
                                                class="title-link"
                                                href="${viewEntryURL}">${htmlUtil.escape(curBlogEntry.getTitle())}
                                            </a>
                                        </h3>
                                    </div>
                                </div>

                                <div class="autofit-row widget-metadata">
                                    <div class="autofit-col autofit-col-expand">
                                        <div class="autofit-row">
                                            <div class="autofit-col autofit-col-expand">
                                                <small>
                                                    <strong>${curBlogEntry.userName}</strong>
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