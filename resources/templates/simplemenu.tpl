{strip}{* defaults *}
    {assign var=cols value=$cols|default:3}
    {assign var=activeclass value=$activeclass|default:"active"}
    {assign var=openclass value=$openclass|default:"opened"}
    {assign var=collevel value=$collevel|default:1}
{* /defaults *}

{*******

    *Табличное деление на колонки по первому уровню *
    data - алиас меню
    span - количесво оберток span для пунктов
    

*******}
{if $type==3}
 <table{if $class} class="{$class}"{/if}>
    <tr>
    {foreach from=`$data` item="e" key="k" name="foo"}
    {if $e._level<$data[$smarty.foreach.foo.iteration]._level}{assign var=has_child value=1}{else}{assign var=has_child value=0}{/if}
    {**** if data vendors ****}
    {if $e.vendor_id>0}
        {** if SEF URL **}{if $site.settings.sef_url}
        {capture assign=data_url}{get_seo_url uri_prefix=$e.page_url mode="vendor" alias=$e.alias}{/capture}
        {else}
        {capture assign=data_url}{$e.page_url}?mode=vendor&amp;vendor_id={$e.vendor_id}{/capture}
        {/if}
        {if $vendor.vendor_id == $e.vendor_id}{assign var=active value=1}{assign var=opened value=1}{else}{assign var=active value=0}{assign var=opened value=0}{/if}
        {assign var=name value=$e.vendor_name|default:$e.name}
        {assign_hash var=e._level value=1}
    {elseif $e.folder_id>0}
        {** if SEF URL **}{if $site.settings.sef_url}
        {capture assign=data_url}{get_seo_url uri_prefix=$e.page_url mode="folder" alias=$e.alias}{/capture}
        {else}
        {capture assign=data_url}{$e.page_url}?mode=folder&amp;folder_id={$e.folder_id}{/capture}
        {/if}
        {if $folder.folder_id == $e.folder_id}{assign var=active value=1}{else}{assign var=active value=0}{/if}
        {if $folder._left>=$e._left && $folder._right<=$e._right}{assign var=opened value=1}{else}{assign var=opened value=0}{/if}
        {assign var=name value=$e.folder_name}
        {if $data.0._level<1}{assign var=k value=$k-1}{/if}
    {else}
        {if $e.page_id==$site.page_id}{assign var=data_url value="/"}{else}{assign var=data_url value=$e.url|default:"javascript:void(0);"}{/if}
        {if $page.page_id == $e.page_id}{assign var=active value=1}{else}{assign var=active value=0}{/if}
        {if $page._left>=$e._left && $page._right<=$e._right && $page.menu_id == $e.menu_id}{assign var=opened value=1}{else}{assign var=opened value=0}{/if}
        {assign var=name value=$e.name}
    {/if}
    {if $e._level>0}
        {if $k > 0}
            {if $e._level > $prev_level}
                <ul>
            {elseif $e._level == $prev_level}
            </li>
            {else}
                {section name="close_tags" start=`$e._level` loop=`$prev_level`}
                </li></ul>
                {/section}
            {/if}
        {/if}
        {assign var=item_classes value=" "|explode:""}

        {if $has_child && $haschildclass}{assign_hash var=item_classes.0 value=$haschildclass}{/if}
        {if $opened && $openclass}{assign_hash var=item_classes.1 value=$openclass}{/if}
        {if $active && $activeclass}{assign_hash var=item_classes.2 value=$activeclass}{/if}

        {if $e._level==1}
            {if $prev_level}
            </ul></td>
            {/if}
            <td><ul><li{if !empty($item_classes) && $item_classes.0 != ""} class="{foreach from=$item_classes item=e2 name=n2}{$e2}{if !$smarty.foreach.n2.last} {/if}{/foreach}"{/if}>
        {else}
            <li{if !empty($item_classes) && $item_classes.0 != ""} class="{foreach from=$item_classes item=e2 name=n2}{$e2}{if !$smarty.foreach.n2.last} {/if}{/foreach}"{/if}>
        {/if}
        <a href="{$data_url}"{if $e.blank} target="_blank"{/if}>{section loop=$span name=sp}<span>{/section}{$name}{section loop=$span name=sp}</span>{/section}</a>
        {assign var="prev_level" value=`$e._level`}
    {/if}
    {/foreach}
    
{if $prev_level==1}
    </ul></tr></table>
{else}
    {section name="close_tags" start=0 loop=`$prev_level`}
        </li></ul>
    {/section}
    </td></tr></table>
    {*</li></ul></td></tr></table>*}
 {/if}

{elseif $type==2}
{*******

    *Равное деление на колонки *
    data - алиас меню
    span - количесво оберток span для пунктов
    cols - количество колонок

*******}
<ul{if $class} class="{$class}"{/if}>
{foreach from=`$data` item=e}
{if $e._level<$data[$smarty.foreach.foo.iteration]._level}{assign var=has_child value=1}{else}{assign var=has_child value=0}{/if}
{**** if data vendors ****}
{if $e.vendor_id>0}{assign_hash var=e._level value=1}{/if}
{if $e._level==1}{assign var="first_level_count" value=$first_level_count+1}{/if}
{/foreach}

{assign var="cols_count" value=$first_level_count/$cols}
{assign var="k1" value=0}
{assign var="current_col" value=1}

{foreach from=`$data` item=e key=k name=pro}
{**** if data vendors ****}
{if $e.vendor_id>0}
    {** if SEF URL **}{if $site.settings.sef_url}
    {capture assign=data_url}{get_seo_url uri_prefix=$e.page_url mode="vendor" alias=$e.alias}{/capture}
    {else}
    {capture assign=data_url}{$e.page_url}?mode=vendor&amp;vendor_id={$e.vendor_id}{/capture}
    {/if}
    {if $vendor.vendor_id == $e.vendor_id}{assign var=active value=1}{assign var=opened value=1}{else}{assign var=active value=0}{assign var=opened value=0}{/if}
    {assign var=name value=$e.vendor_name|default:$e.name}
    {assign_hash var=e._level value=1}
{elseif $e.folder_id>0}
    {** if SEF URL **}{if $site.settings.sef_url}
    {capture assign=data_url}{get_seo_url uri_prefix=$e.page_url mode="folder" alias=$e.alias}{/capture}
    {else}
    {capture assign=data_url}{$e.page_url}?mode=folder&amp;folder_id={$e.folder_id}{/capture}
    {/if}
    {if $folder.folder_id == $e.folder_id}{assign var=active value=1}{else}{assign var=active value=0}{/if}
    {if $folder._left>=$e._left && $folder._right<=$e._right}{assign var=opened value=1}{else}{assign var=opened value=0}{/if}
    {assign var=name value=$e.folder_name}
    {if $data.0._level<1}{assign var=k value=$k-1}{/if}
{else}
    {if $e.page_id==$site.page_id}{assign var=data_url value="/"}{else}{assign var=data_url value=$e.url|default:"javascript:void(0);"}{/if}
    {if $page.page_id == $e.page_id}{assign var=active value=1}{else}{assign var=active value=0}{/if}
    {if $page._left>=$e._left && $page._right<=$e._right && $page.menu_id == $e.menu_id}{assign var=opened value=1}{else}{assign var=opened value=0}{/if}
    {assign var=name value=$e.name}
{/if}

{if $e._level<3 && $e._level>0}

{if $e._level==1}
    {if $k1>=($cols_count*$current_col) && $k1}
        </ul><ul{if $class} class="{$class}"{/if}>
        {assign var="current_col" value=$current_col+1}
    {/if}
    {assign var="k1" value=$k1+1}
{/if}

{assign var=item_classes value=" "|explode:""}
{if $has_child && $haschildclass}{assign_hash var=item_classes.0 value=$haschildclass}{/if}
{if $opened && $openclass}{assign_hash var=item_classes.1 value=$openclass}{/if}
{if $active && $activeclass}{assign_hash var=item_classes.2 value=$activeclass}{/if}
<li{if !empty($item_classes) && $item_classes.0 != ""} class="{foreach from=$item_classes item=e2 name=n2}{$e2}{if !$smarty.foreach.n2.last} {/if}{/foreach}"{/if}><a href="{$data_url}" {if $e.blank}target="_blank"{/if}>{section loop=$span name=sp}<span>{/section}{$name}{section loop=$span name=sp}</span>{/section}</a></li>
{/if}
{/foreach}
</ul>
{elseif $type == 4}
{*******

    * Многоуровневое меню с возможностью делить на колонки *
    * data - алиас меню
    * span - количесво оберток span для пунктов
    * collevel - уровень который нужно поделить на колонки
    * cols - кол-во колонок на которое нужно поделить

*******}

{if !empty($data)}

    {if $collevel==1}
        {foreach from=$data item=e}
            {if $e._level==1 || $e.vendor_id > 0}
                {assign var=m_count value=$m_count+1}
            {/if}
        {/foreach}
        {assign var=ceil_amount value=$m_count/$cols}
        {assign var=ceil_amount value=$ceil_amount|floor}
        {assign var=additional_value value=$m_count%$cols}
    {else}
        {foreach from=$data item=e key=k}
            {if $e._level > 0}
                {if $e._level==$collevel-1}
                    {assign_hash var=e._childs value=0}
                    {assign var=parent_index value=$k}
                {elseif $e._level==$collevel}
                    {assign var=parent value=$data.$parent_index}
                    {assign_hash var=parent._childs value=$parent._childs+1}
                    {assign_hash var=data.$parent_index value=$parent}
                {/if}
            {/if}
        {/foreach}
    {/if}

    

    <ul{if $class} class="{$class}"{/if}>
    {assign var=key value=0}
    {assign var=key_2 value=0}
    {assign var=curent_column value=1}
    {foreach from=$data item=e key=k name="foo"}

        {if $e._level<$data[$smarty.foreach.foo.iteration]._level}{assign var=has_child value=1}{else}{assign var=has_child value=0}{/if}

        {if $e.vendor_id>0}
            {** if SEF URL **}{if $site.settings.sef_url}
            {capture assign=data_url}{get_seo_url uri_prefix=$e.page_url mode="vendor" alias=$e.alias}{/capture}
            {else}
            {capture assign=data_url}{$e.page_url}?mode=vendor&amp;vendor_id={$e.vendor_id}{/capture}
            {/if}
            {if $vendor.vendor_id == $e.vendor_id}{assign var=active value=1}{assign var=opened value=1}{else}{assign var=active value=0}{assign var=opened value=0}{/if}
            {assign var=name value=$e.vendor_name|default:$e.name}
            {assign var=id value=$e.vendor_id}
            {assign_hash var=e._level value=1}

        {elseif $e.folder_id>0}
            {** if SEF URL **}{if $site.settings.sef_url}
            {capture assign=data_url}{get_seo_url uri_prefix=$e.page_url mode="folder" alias=$e.alias}{/capture}
            {else}
            {capture assign=data_url}{$e.page_url}?mode=folder&amp;folder_id={$e.folder_id}{/capture}
            {/if}
            {if $folder}
            {if $folder.folder_id == $e.folder_id}{assign var=active value=1}{else}{assign var=active value=0}{/if}
            {if $folder._left>=$e._left && $folder._right<=$e._right}{assign var=opened value=1}{else}{assign var=opened value=0}{/if}
            {/if}
            {if $product}
            {foreach from=$product.folders item=z}
            {if $z.folder_id == $e.folder_id}{assign var=active value=1}{else}{assign var=active value=0}{/if}
            {if $z._left>=$e._left && $z._right<=$e._right}{assign var=opened value=1}{else}{assign var=opened value=0}{/if}
            {/foreach}
            {/if}
            {assign var=name value=$e.folder_name}
            {assign var=id value=$e.folder_id}

        {else}
            {if $e.page_id==$site.page_id}{assign var=data_url value="/"}{else}{assign var=data_url value=$e.url|default:"javascript:void(0);"}{/if}
            {if ($page.url == $e.url && $e.url_link == "") || $page.page_id == $e.page_id}{assign var=active value=1}{else}{assign var=active value=0}{/if}
            {if $page._left>=$e._left && $page._right<=$e._right && $page.menu_id == $e.menu_id}{assign var=opened value=1}{else}{assign var=opened value=0}{/if}
            {assign var=name value=$e.name}
            {assign var=id value=$e.page_id}

        {/if}

        {if $e._level>0}

            {if $e._level+1==$collevel}
                {assign var=ceil_amount value=$e._childs/$cols}
                {assign var=ceil_amount value=$ceil_amount|floor}
                {assign var=additional_value value=$e._childs%$cols}
                {assign var=extra_index value=0}
                {assign var=curent_column value=1}
                {assign var=key value=0}
            {/if}

            {if $key_2 > 0}

                {if $e._level > $prev_level}
                    {if $e._level==$collevel}<div>{/if}<ul class="level-{$e._level}">
                {else}
                    </li>
                    {section name="close_tags" start=`$e._level` loop=`$prev_level`}
                        </ul>{* do not touch - its magic *}{if $prev_level-$smarty.section.close_tags.index==$collevel-$e._level}</div>{/if}</li>
                    {/section}
                    {if $e._level==$collevel}

                        {if $curent_column<=$additional_value}
                            {assign var=pre_ceil_amount value=$ceil_amount+1}
                            {assign var=divide_index value=$curent_column*$pre_ceil_amount}
                            {if $key==$divide_index}
                                {assign var=extra_index value=$extra_index+1}
                            {/if}

                        {else}
                            {assign var=divide_index value=$curent_column*$ceil_amount+$extra_index}
                        {/if}
                        {if $key>=$divide_index}
                            {capture assign="ul_class"}{if $e._level == 1}{$class}{else}level-{$e._level}{/if}{/capture}
                            </ul><ul {if $ul_class != ""}class="{$ul_class}"{/if}>
                            {assign var=curent_column value=$curent_column+1}
                        {/if}
                    {/if}
                {/if}

            {/if}

            {assign var=item_classes value=" "|explode:""}
            {if $has_child && $haschildclass}{assign_hash var=item_classes.0 value=$haschildclass}{/if}
            {if $opened && $openclass}{assign_hash var=item_classes.1 value=$openclass}{/if}
            {if $active && $activeclass}{assign_hash var=item_classes.2 value=$activeclass}{/if}

            <li{if !empty($item_classes) && $item_classes.0 != "" || $item_classes|@count>1} class="{foreach from=$item_classes item=e2 name=n2}{if $e2}{$e2}{if !$smarty.foreach.n2.last} {/if}{/if}{/foreach}"{/if}><a href="{$data_url}" {if $e.blank} target="_blank"{/if}>{section loop=$span name=sp}<span>{/section}{$name}{section loop=$span name=sp}</span>{/section}</a>

            {assign var="prev_level" value=`$e._level`}

            {if $e._level==$collevel}
                {assign var=key value=$key+1}
            {/if}

            {assign var="key_2" value=$key_2+1}

        {/if}

    {/foreach}
    {section name="close_tags" start=1 loop=`$prev_level`}
        </li></ul>
            {if $prev_level-$smarty.section.close_tags.index==$collevel-1}
                </div>
            {/if}
    {/section}
    </li></ul>
{/if}
{else}
{*******

    *Простое многоуровневое меню *
    data - алиас меню
    span - количесво оберток span для пунктов

*******}
{capture assign=outputmenu}
{if $subfrom>0}
{foreach from=$data item=e}{if ($e.vendor_id>0 && $e.vendor_id==$subfrom) || ($e.folder_id>0 && $e.folder_id==$subfrom) || ($e.page_id==$subfrom)}{assign var=fromparent value=$e}{/if}{/foreach}
{/if}
{if $fromlevel && $tolevel}
    {assign var=tolevel value=$tolevel+1}
{/if}
{if !$fromlevel}
    {assign var=fromparent_level value=$fromparent._level|default:0}
{/if}
{if $item_data != ""}
    {assign var=array_separator value=$item_data_array_separator|default:"|,|"}{* Разделитель пунктов меню *}
    {assign var=sub_array_separator value=$item_data_sub_array_separator|default:"|:|"} {* Разделитель данных для пункта *}
    {assign var=item_data_explode value=$array_separator|explode:$item_data}
    {assign var=item_data_array value=" "|explode:""}
    {foreach from=$item_data_explode item=e}
        {assign var=e_array value=$sub_array_separator|explode:$e}
        {assign_hash var=item_data_array.$e_array[0] value=$e_array[1]}
    {/foreach}
{/if}
<ul{if $class} class="{$class}"{/if}>
{assign var=key value=0}
{foreach from=`$data` item="e" name="foo"}
{if $e._level<$data[$smarty.foreach.foo.iteration]._level}{assign var=has_child value=1}{else}{assign var=has_child value=0}{/if}
{if $fromlevel}{assign_hash var=e._level value=$e._level-$fromlevel+1}{/if}
{**** if data vendors ****}
{if $e.vendor_id>0}
    {** if SEF URL **}{if $site.settings.sef_url}
    {capture assign=data_url}{get_seo_url uri_prefix=$e.page_url mode="vendor" alias=$e.alias}{/capture}
    {else}
    {capture assign=data_url}{$e.page_url}?mode=vendor&amp;vendor_id={$e.vendor_id}{/capture}
    {/if}
    {if $vendor.vendor_id == $e.vendor_id}{assign var=active value=1}{assign var=opened value=1}{else}{assign var=active value=0}{assign var=opened value=0}{/if}
    {assign var=name value=$e.vendor_name|default:$e.name}
    {assign var=id value=$e.vendor_id}
    {assign_hash var=e._level value=1}

{elseif $e.folder_id>0}
    {** if SEF URL **}{if $site.settings.sef_url}
    {capture assign=data_url}{get_seo_url uri_prefix=$e.page_url mode="folder" alias=$e.alias}{/capture}
    {else}
    {capture assign=data_url}{$e.page_url}?mode=folder&amp;folder_id={$e.folder_id}{/capture}
    {/if}
    {if $folder}
    {if $folder.folder_id == $e.folder_id}{assign var=active value=1}{else}{assign var=active value=0}{/if}
    {if $folder._left>=$e._left && $folder._right<=$e._right}{assign var=opened value=1}{else}{assign var=opened value=0}{/if}
    {/if}
    {if $product}
    {foreach from=$product.folders item=z}
    {if $z.folder_id == $e.folder_id}{assign var=active value=1}{else}{assign var=active value=0}{/if}
    {if $z._left>=$e._left && $z._right<=$e._right}{assign var=opened value=1}{else}{assign var=opened value=0}{/if}
    {/foreach}
    {/if}
    {assign var=name value=$e.folder_name}
    {assign var=id value=$e.folder_id}

{else}
    {if $e.page_id==$site.page_id}{assign var=data_url value="/"}{else}{assign var=data_url value=$e.url|default:"javascript:void(0);"}{/if}
    {if ($page.url == $e.url && $e.url_link == "") || $page.page_id == $e.page_id}{assign var=active value=1}{else}{assign var=active value=0}{/if}
    {if $page._left>=$e._left && $page._right<=$e._right && $page.menu_id == $e.menu_id}{assign var=opened value=1}{else}{assign var=opened value=0}{/if}
    {assign var=name value=$e.name}
    {assign var=id value=$e.page_id}

{/if}
{if $e._level>0 && ( ($e._left > $fromparent._left  && $e._right < $fromparent._right) || !$subfrom) && (!$tolevel || $e._level < $tolevel-$fromlevel)}
{if !$showmenu}{assign var=showmenu value=1}{/if}
{if $key > 0}
    {if $e._level > $prev_level}
        <ul class="level-{$e._level}">
    {else}
        </li>
        {section name="close_tags" start=`$e._level` loop=`$prev_level`}
            </ul></li>
        {/section}
    {/if}
{/if}
{assign var=item_classes value=" "|explode:""}
{if $has_child && $haschildclass}{assign_hash var=item_classes.0 value=$haschildclass}{/if}
{if $opened && $openclass}{assign_hash var=item_classes.1 value=$openclass}{/if}
{if $active && $activeclass}{assign_hash var=item_classes.2 value=$activeclass}{/if}
<li{if !empty($item_classes) && $item_classes.0 != "" || $item_classes|@count>1} class="{foreach from=$item_classes item=e2 name=n2}{if $e2}{$e2}{if !$smarty.foreach.n2.last} {/if}{/if}{/foreach}"{/if}><a href="{$data_url}" {if $e.blank} target="_blank"{/if}>{section loop=$span name=sp}<span>{/section}{$name}{section loop=$span name=sp}</span>{/section}</a>
    {$item_data_array[$id]}
{assign var="prev_level" value=`$e._level`}
{assign var=key value=$key+1}
{/if}
{/foreach}
{section name="close_tags" start=1 loop=`$prev_level-$fromparent_level`}
    </li></ul>
{/section}
</li></ul>
{/capture}{if $showmenu}{$outputmenu}{/if}
{/if}{/strip}