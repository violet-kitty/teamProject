<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 닉네임 받는 모달 -->
		<div class="modal py-10 px-3" tabindex="-1" role="dialog" id="modalDiv">
			<div class="modal-dialog hbshadow" role="document">
				<div class="modal-content">
					<h2 class="hfc-bold">나의 닉네임 설정하기</h2>

					<form id="modalFrm" action="nicknameInsert.do" method="post">
						<div class="form-floating ">
							<p class="text-muted">HOWF에서 사용하실 닉네임을 입력해주세요</p>
							<div>
								<input type="text" name="nickname" id="nickname" placeholder="닉네임 입력"><span id="nicknameTxt"></span>
								<input type="hidden" name="email" id="emailHidden">
								<input type="hidden" name="midx" id="midxHidden">
							</div>
							<p class="hfc-pink">최초 닉네임 설정 이후, 닉네임을 변경하실 수 없습니다.</p>
						</div>
					</form>
					<div class="btnarea">
						<!-- <button type="button" class="graybtn w-30" data-bs-dismiss="modalDiv" aria-label="Close">닫기</button> -->
						<button type="button" class="bluebtn w-100" onclick="nicknameFn()">닉네임 입력완료!</button>
					</div>
				</div>
			</div>
		</div>