<?php
// echo "<pre>";
// print_r($Question_Data);
// echo "</pre>";
// die();
$this->load->helper('date');
?>
<section class="banner inner-page">
	<div class="banner-img"><img src="<?=base_url('resources/user/assets/');?>images/banner/1.png" alt=""></div>
	<div class="page-title">	
		<div class="container">
			<h1>Share Knowledge</h1>
		</div>
	</div>
</section>
<section class="breadcrumb">
	<div class="container">
		<ul>
			<li><a href="<?=site_url('/home/');?>">Home</a></li>
			<li><a href="#">Share Knowledge</a></li>
		</ul>
	</div>
</section>
<!-- <section class="banner">
	<div class="banner-img"><img src="<?=base_url('resources/user/assets/');?>images/banner/1.png" alt=""></div>
	<div class="banner-text">
		<div class="container">
			<br><h1>Get and Share Knowledge</h1>
		</div>
	</div>
</section> -->
<section class="student-feedback">
	<div class="forums-page">
		<div class="container">
			<h2 style="color:#02cbf7;text-decoration:underline;text-align:center;">Ask Your Question Below</h2>
			<script src="<?=base_url('/resources/admin/assets/niceditor/');?>nicEdit.js" type="text/javascript"></script>
			<script type="text/javascript">
			bkLib.onDomLoaded(function() {
				new nicEditor({fullPanel : true}).panelInstance('aQuestionContent');
			});
			</script>
			<form method="POST" action="<?=site_url('/AskQuestion/addquestion')?>">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-8" style="text-align:center;">
							<font style="font-size:1.8em">Title : </font><input type="text" name="aQuestionTitle" id="aQuestionTitle" placeholder="Title" autofocus>
						</div>
						<div class="col-sm-4">
							<button type="submit" style="border-style:solid;border-width:2px;" class="btn2">Post</button><br><br>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-10 col-sm-offset-1">
							<textarea name="aQuestionContent" id="aQuestionContent" class="textarea" placeholder="Ask your Question" style="color:black;width: 100%; height: 370px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
								<font color="black"><h3><u>Ask </u><b>Question </b><i>Here</i></h3></font>
							</textarea>
						</div>
										<style type="text/css">
											.default-tag{
												line-height: 36px;
												padding: 0 15px;
												border: solid 1px #e0e0e0;
												border-radius: 18px;
												color: #9C9C9C;
												background: #f5f5f5;
												text-decoration: none;
												font-size: 15px;
												transition: all 0.7s ease-in-out 0s;
											}
											.alter-tag{
												line-height: 36px;
												padding: 0 15px;
												border: solid 1px #e0e0e0;
												border-radius: 18px;
												color: white;
												background: #02cbf7;
												text-decoration: none;
												font-size: 15px;
												transition: all 0.7s ease-in-out 0s;
											}
										</style>
										<div class="col-sm-10 col-sm-offset-1" style="margin-top:15px;">
											<?php
												foreach ($TagData as $td) {
													?>
														<label for="tag-<?=$td->TagID;?>" class="default-tag labela"><?=$td->TagName;?></label>
														<input id="tag-<?=$td->TagID;?>" style="display: none;" type="checkbox" name="tag[]" value="<?=$td->TagID;?>">
													<?php
												}
											?>
										</div>
										<script type="text/javascript">
											$(function(){
												$('.labela').on('click',function(){
													$(this).toggleClass('default-tag alter-tag');
												});
											});
										</script>
					</div>
				</div>
				<script type="text/javascript">
					function readURL(input)	{
						if (input.files && input.files[0]) {
							var reader = new FileReader();
							reader.onload = function(e) {
								$(input).prev().children(":first").attr('src', e.target.result);
							}
							reader.readAsDataURL(input.files[0]);
						}
					}
				</script>
			</form>
		</div>
	</div>
</section>
<div class="forums-page">
	<div class="container">
		<div class="row">
			<div class="col-sm-9">
				<!--
					<div class="group-details">
						<div class="cover-img"><img src="<?=base_url('resources/user/assets/');?>images/user-img/group-img.jpg" alt=""></div>
						<div class="group-info">
							<div class="group-prifile"><img src="<?=base_url('resources/user/assets/');?>images/user-img/group-profile.jpg" alt=""></div> 
							<div class="group-status">
								<div class="group-type">private group</div>
								<span>active 8 months, 3 weeks ago</span>
							</div>
							<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. </p>
						</div>
					</div>
				-->
				<div class="">
					<!--
						<div class="tab-menu">
							<ul>
								<li><a href="forums-profile-activity.html">Activity</a></li>
								<li><a href="forums-profile.html">Profile</a></li>
								<li><a href="forums-profile-friends.html">Friends <span>9</span></a></li>
								<li><a href="forums-profile-groups.html">Groups <span>2</span></a></li>
								<li class="active"><a href="forums-profile-forums.html">Forums</a></li>
							</ul>
						</div>
					-->
					<!--
						<div class="sub-title">
							<div class="right-select">
								<span class="select-label">Show :</span>
								<div class="select-box">
									<select class="order-select">
										<option>Last Active</option>
										<option>Newest Registered</option>
										<option>Alphabetical</option>
									</select>
								</div>
							</div>
						</div>
					-->
					<H2 style="color:#02cbf7;" >FeedBack</H2><br>
					<div class="forum-details">
						<?php
							$flag=0;
							foreach ($Question_Data as $qd)
							{
						?>
								<div class="details-slide
								<?php
									if($flag==0)
										echo " even ";
								?>
								">
									<div class="name"><a href="<?=site_url('/ForumQuestion/'.$qd->ForumQID);?>"><?=$qd->ForumQTitle?></a></div>
									<div class="info">
										<div class="block"><img src="<?=base_url('resources/user/uploads/'.$qd->UserAvatar);?>" alt=""><a href="<?=site_url('/Profile/'.$qd->UserID);?>"><?=$qd->UserName?></a></div>
										<div class="block"><i class="fa fa-thumbs-up">	</i><?=$qd->UpVote?>  </div>
										<div class="block"><i class="fa fa-thumbs-down"></i><?=$qd->DownVote?></div>
										<div class="block"><i class="fa fa-comment-o">	</i><?=$qd->answer?>  </div>
										<div class="block"><i class="fa fa-clock-o">		</i>
											<?php
												$dt = DateTime::createFromFormat('Y-m-d H:i:s', $qd->CreatedDateTime);
												$dd3 = $dt->getTimestamp();
												echo timespan($dd3, '', 2). ' ago';
											?>
										</div>
									</div>
								</div>
						<?php
							$flag=1-$flag;
							}
						?>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="right-slide">
					<h3>Members</h3>
					<div class="member-list">
						<?php
							foreach ($UserData as $ud)
							{
								if($ud->UserID!=$this->session->UserID)
								{
						?>
									<div class="member-slide">
										<div class="img"><img src="<?=base_url('resources/user/uploads/'.$ud->UserAvatar);?>" alt=""></div>
										<div class="name"><a href="<?=site_url('/profile/'.$ud->UserID);?>"><?=$ud->UserName?></a></div>
										<div class="activity"><?=$ud->UserXP?> XP</div>
									</div>
						<?php
								}
							}
						?>
					</div>
					<!--
						<h3>Groups</h3>
						<div class="member-list">
							<div class="member-slide">
								<div class="img"><img src="<?=base_url('resources/user/assets/');?>images/user-img/testimonial-img2.jpg" alt=""></div>
								<div class="name"><a href="forums-group-details.html">Jamie Nicholson</a></div>
								<div class="activity">active 2 day, 3 hours ago</div>
							</div>
							<div class="member-slide">
								<div class="img"><img src="<?=base_url('resources/user/assets/');?>images/user-img/testimonial-img3.jpg" alt=""></div>
								<div class="name"><a href="forums-group-details.html">Dieter Baum</a></div>
								<div class="activity">active 11 day, 9 hours ago</div>
							</div>
						</div>
						<h3>Recent Replies</h3>
						<div class="replies-course">
							<div class="course-slide">
								<div class="name"><img src="<?=base_url('resources/user/assets/');?>images/user-img/testimonial-img1.jpg" alt=""><a href="forums-profile.html">Dieter</a> on <a href="forum-single-topic.html">E-Learn 2015</a></div>
								<div class="date">29 Day ago</div>
							</div>
							<div class="course-slide">
								<div class="name"><img src="<?=base_url('resources/user/assets/');?>images/user-img/testimonial-img2.jpg" alt=""><a href="forums-profile.html">Jamie</a> on <a href="forum-single-topic.html">Y-Learn 2015</a></div>
								<div class="date">2 Month ago</div>
							</div>
							<div class="course-slide">
								<div class="name"><img src="<?=base_url('resources/user/assets/');?>images/user-img/testimonial-img3.jpg" alt=""><a href="forums-profile.html">Kavanagh</a> on <a href="forum-single-topic.html">Exam-Learn 2015</a></div>
								<div class="date">1 Year ago</div>
							</div>
						</div>
						<h3>Recent Topics</h3>
						<div class="replies-course topics">
							<div class="course-slide">
								<div class="name"><a href="forums-profile.html">Dieter</a> on by <img src="<?=base_url('resources/user/assets/');?>images/user-img/testimonial-img1.jpg" alt="">  <a href="forum-single-topic.html">E-Learn 2015</a></div>
								<div class="date">29 Day ago</div>
							</div>
							<div class="course-slide">
								<div class="name"><a href="forums-profile.html">Jamie</a> on by <img src="<?=base_url('resources/user/assets/');?>images/user-img/testimonial-img2.jpg" alt=""> <a href="forum-single-topic.html">Y-Learn 2015</a></div>
								<div class="date">2 Month ago</div>
							</div>
							<div class="course-slide">
								<div class="name"><a href="forums-profile.html">Kavanagh</a> on by <img src="<?=base_url('resources/user/assets/');?>images/user-img/testimonial-img3.jpg" alt=""><a href="forum-single-topic.html">Exam-Learn 2015</a></div>
								<div class="date">1 Year ago</div>
							</div>
						</div>
						<h3>Forum Statistics</h3>
						<ul class="working-list">
							<li>Replies<span>5</span></li>
							<li>Topics<span>10</span></li>
							<li>Topic Tags<span>7</span></li>
							<li>Registered Users<span>888</span></li>
							<li>Forums<span>5</span></li>
						</ul>
						<h3>Topic Views List</h3>
						<ul class="catagorie-list">
							<li><a href="#">Most popular Course</a></li>
							<li><a href="#">Exam Course</a></li>
							<li><a href="#">Course Details</a></li>
						</ul>
					-->
					<h3>Tag</h3>
					<ul class="keyword-list">
					    <?php
    						foreach ($TagData as $tagd)
    						{
					    ?>
			    			    <li>
			    			        <a href="<?=site_url('/ForumQuestion/filter/'.$tagd->TagID)?>" style="background:rgb(245, 245, 245);display: block;line-height: 36px;padding: 0 15px;border: solid 1px #e0e0e0;border-radius: 18px;color: #9C9C9C;text-decoration: none;font-size: 15px;transition: all 0.7s ease-in-out 0s;" onmouseover="this.style.background='#02cbf7';this.style.color='white';" onmouseout="this.style.background='#f5f5f5';this.style.color='#9C9C9C';"><?=$tagd->TagName?></a>
			    			    </li>
                        <?php
    						}
                        ?>
					</ul>
					<label style="color:red;">
					    <?php
					        if(isset($error))
					            echo $error;
					    ?>
					</label>
				</div>
			</div>
		</div>
	</div>
</div>