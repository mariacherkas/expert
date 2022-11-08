{if $rsCountIndex}
    <div style="clear:both;"></div>
    <div style="text-align: center">
        <nav aria-label="...">
            <ul class="pagination  justify-content-center">
                {if $rsCountIndex[0]['count'] % $limit == 0 || $rsCountIndex[0]['count'] < $limit}
                    {for $i = 1; $i <= {$rsCountIndex[0]['count'] / $limit}; $i++}
                <li class="page-item"><a href="/?controller=index&count={$i-1}" class="page-link">{$i}</a></li>
                    {/for}
                {else}
                    {for $i = 1; $i <= {$rsCountIndex[0]['count'] / $limit + 1}; $i++}
                <li class="page-item"><a href="/?controller=index&count={$i-1}" class="page-link">{$i}</a></li>
                    {/for}
                {/if}
            </ul>
        </nav>
    </div>
{elseif $rsCount}
    <div style="clear:both;"></div>
    <div style="text-align: center">
        <nav aria-label="...">
            <ul class="pagination pagination-lg justify-content-center">
                {if $rsCount[0]['count'] % $limit == 0 || $rsCount[0]['count'] < $limit}
                    {for $i = 1; $i <= {$rsCount[0]['count'] / $limit}; $i++}
                        <li class="page-item"><a href="/?controller=category&id={$rsCategory['id']}&count={$i-1}" class="page-link">{$i}</a></li>
                    {/for}
                {else}
                    {for $i = 1; $i <= {$rsCount[0]['count'] / $limit + 1}; $i++}
                        <li class="page-item"><a href="/?controller=category&id={$rsCategory['id']}&count={$i-1}" class="page-link">{$i}</a></li>
                    {/for}
                {/if}
            </ul>
        </nav>
    </div>
{/if}