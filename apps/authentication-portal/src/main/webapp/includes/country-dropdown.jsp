<%--
  ~ Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
  ~
  ~ WSO2 Inc. licenses this file to you under the Apache License,
  ~ Version 2.0 (the "License"); you may not use this file except
  ~ in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~     http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing,
  ~ software distributed under the License is distributed on an
  ~ "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  ~ KIND, either express or implied.  See the License for the
  ~ specific language governing permissions and limitations
  ~ under the License.
--%>


<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.TreeMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%!
    /**
     * Retrieve all county codes and country display names and
     * store into a map where key/value pair is defined as the
     * country code/country display name.
     *
     * @return {Map<string, string>}
     */
    private Map<String, String> getCountryList() {
        String[] countryCodes = Locale.getISOCountries();

        Map<String, String> mapCountries = new TreeMap<>();

       for (String countryCode : countryCodes) {
            Locale locale = new Locale("", countryCode);
            String country_code = locale.getCountry();
            String country_display_name = locale.getDisplayCountry();
            mapCountries.put(country_code, country_display_name);
        }

        return mapCountries;
    }
%>

<div class="ui fluid search selection dropdown"  id="country-dropdown">
    <input type="hidden" required="${ param.required }"
    data-testid="request-claims-page-form-field-claim-${param.claim}-input"
    name="claim_mand_${param.claim}" id="claim_mand_${param.claim}">
    <i class="dropdown icon" id="country-dropdown"></i>
    <div class="default text">Select Country</div>
    <div class="menu">
        <c:forEach items="<%=getCountryList()%>" var="country">
            <div class="item" data-value="${country.value}">
                <i class="${country.key.toLowerCase()} flag"></i>${country.value}
            </div>
        </c:forEach>
    </div>
</div>

<script defer>

    $(document).ready(function() {
        $("#country-dropdown").dropdown('hide');
    });

</script>




