<%@ page contentType="text/html; charset=UTF-8" %>

	<%-- include할 곳에 이거 복붙하시면 됩니당
	 
	<link rel = "stylesheet" href = "/TeamCommit/resource/includes/week.css" />
	<script src="/TeamCommit/resource/includes/js/week.js"></script>  
	
	--%>

	<div class="calendar-wrap">
		<div class="date-wrap slick-initialized slick-slider">
			<div class="slick-list draggable">
				<div class="slick-track">
					<div class="slick-slide current slick-active">
						<div class="box">
							<button type="button" class="preBtn" onclick = "prevWeek();">
								<span class="previous">&lt</span>
							</button>
						</div>
					</div>
					<div class="slick-slide current slick-active" data-click-index="0" aria-hidden="false">
						<div class="box">
							<button type="button" class="btn" id = "day1" onclick="selectButton(this);">
								<div id="day1"></div>
							</button>
						</div>
					</div>
					<div class="slick-slide slick-active" data-click-index="1" aria-hidden="false">
						<div class="box">
							<button type="button" class="btn" id = "day2" onclick="selectButton(this);">
								<div id="day2"> </div>
							</button>
						</div>
					</div>
					<div class="slick-slide slick-active" data-click-index="2" aria-hidden="false">
						<div class="box">
							<button type="button" class="btn" id = "day3" onclick="selectButton(this);">
								<div id="day3"> </div>
							</button>
						</div>
					</div>
					<div class="slick-slide slick-active" data-click-index="3" aria-hidden="false">
						<div class="box">
							<button type="button" class="btn" id = "day4" onclick="selectButton(this);">
								<div id="day4"> </div>
							</button>
						</div>
					</div>
					<div class="slick-slide slick-active" data-click-index="4" aria-hidden="false">
						<div class="box">
							<button type="button" class="btn" id = "day5" onclick="selectButton(this);">
								<div id="day5"> </div>
							</button>
						</div>
					</div>
					<div class="slick-slide slick-active" data-click-index="5" aria-hidden="false">
						<div class="box">
							<button type="button" class="btn" id = "day6" onclick="selectButton(this);">
								<div id="day6"> </div>
							</button>
						</div>
					</div>
					<div class="slick-slide slick-active" data-click-index="6" aria-hidden="false">
						<div class="box">
							<button type="button" class="btn" id = "day7" onclick="selectButton(this);">
								<div id="day7"> </div>
							</button>
						</div>
					</div>
					<div class="slick-slide current slick-active">
						<div class="box">
							<button type="button" class="nextBtn" onclick = "nextWeek();">
								<span class="next">&gt</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>

