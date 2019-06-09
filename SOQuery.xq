declare variable $threshold as xs:int external;
declare function local:getUsers() as node()
{

		<users>
		{
			for $u in doc("Users.xml")//users/row[@Reputation >= $threshold] 	
			order by $u/xs:int(@Reputation) descending
			return <user Id="{$u/@Id/string()}">
					<name>{$u/@DisplayName/string()}</name>
					<location>{$u/@Location/string()}</location>
					<reputation>{xs:int($u/@Reputation)}</reputation>
					<upVotes>{xs:int($u/@UpVotes)}</upVotes>
					<downVotes>{xs:int($u/@DownVotes)}</downVotes>
					<top_post>{local:getTopPost($u)}</top_post>


				</user>
		}
		</users>
};

declare function local:getTopPost($user as element(row)) as xs:string
{
	let $dateOrderedPosts :=
		for $x in doc("Posts.xml")/posts/row[@OwnerUserId = $user/@Id]
		order by $x/xs:string(@CreationDate) descending
		return $x

	let $scoreDateOrderedPosts :=
		for $y in $dateOrderedPosts
		order by $y/xs:int(@Score) descending
		return $y

	return
		if(count($scoreDateOrderedPosts/@Body) != 0)
		then
			$scoreDateOrderedPosts[position() = 1]/@Body/string()
		else
			""
};



declare function local:error() as node()
{
	<error>
		Users not found
	</error>
};

<result>
{
	let $users := (local:getUsers())
	return
		if (count($users/user) = 0)
		then
			local:error()
		else
			$users
		
}
</result>
