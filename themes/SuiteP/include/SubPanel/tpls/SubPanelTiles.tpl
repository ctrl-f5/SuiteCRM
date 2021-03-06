<br>

<script type="text/javascript" src="{sugar_getjspath file='include/SubPanel/SubPanelTiles.js'}"></script>


<ul class="noBullet" id="subpanel_list">
{foreach from=$subpanel_tabs key=i item=subpanel_tab}
    <li class="noBullet" id="whole_subpanel_{$subpanel_tab}">
        <div class="panel panel-default sub-panel">
            <div class="panel-heading panel-heading-collapse">
                <a id="subpanel_title_{$subpanel_tab}" class="collapsed" role="button" data-toggle="collapse" href="#subpanel_{$subpanel_tab}" aria-expanded="false">
                    <div class="col-xs-10 col-sm-11 col-md-11">
                        <div>
                           <img src="{sugar_getimagepath directory='sub_panel' file_name=$subpanel_tabs_properties.$i.module_name file_extension='svg'}">
                            {$subpanel_tabs_properties.$i.title}
                        </div>
                    </div>
                </a>

            </div>
            <div class="panel-body panel-collapse collapse" id="subpanel_{$subpanel_tab}">
                    <div class="tab-content">
                        <div id="list_subpanel_{$subpanel_tab}">
                            {$subpanel_tabs_properties.$i.subpanel_body}
                        </div>
                    </div>
            </div>
        </div>
    </li>
{/foreach}
</ul>
{if empty($sugar_config.lock_subpanels) || $sugar_config.lock_subpanels == false}
    {*drag and drop code*}
    <script>
        {literal}
        var SubpanelInit = function() {
            SubpanelInitTabNames({/literal}{$tab_names}{literal});
        }
        var SubpanelInitTabNames = function(tabNames) {
            subpanel_dd = new Array();
            j = 0;
            for(i in tabNames) {
                subpanel_dd[j] = new ygDDList('whole_subpanel_' + tabNames[i]);
                subpanel_dd[j].setHandleElId('subpanel_title_' + tabNames[i]);
                subpanel_dd[j].onMouseDown = SUGAR.subpanelUtils.onDrag;
                subpanel_dd[j].afterEndDrag = SUGAR.subpanelUtils.onDrop;
                j++;
            }
            YAHOO.util.DDM.mode = 1;
        }
        currentModule = '{/literal}{$module}{literal}';
        SUGAR.util.doWhen(
                "typeof(SUGAR.subpanelUtils) == 'object' && typeof(SUGAR.subpanelUtils.onDrag) == 'function'" +
                " && document.getElementById('subpanel_list')",
                SubpanelInit
        );
        {/literal}
    </script>
{/if}
<script>
    var ModuleSubPanels = {$module_sub_panels};
</script>


{*{/if}*}