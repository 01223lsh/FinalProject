package web.unitTest.serviceTest;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.BDDMockito.*;

import funding.commons.Pagination;
import funding.dao.face.ProjectDao;
import funding.dto.Project;
import funding.service.face.ProjectService;
import funding.service.impl.ProjectServiceImpl;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

@ExtendWith(MockitoExtension.class)
public class ProjectServiceTest {
    @InjectMocks
    ProjectService projectService = new ProjectServiceImpl();

    @Mock
    ProjectDao projectDao;

    @Test
    @DisplayName("프로젝트 리스트 가져오기")
    void getPageList() throws Exception {
        // given
        // 검색어, 정렬기준, 필터정보, 현재페이지 정보
        // MockDao: 조건에 따른 프로젝트 목록 개수 - 30개
        // MockDao: 빌드된 pagination 조건에 따른 프로젝트 목록
        Pagination pagination = new Pagination();
        pagination.setCategory("1");
        pagination.setFilter("4");
        pagination.setKeyword("검색어");
        pagination.setOrder("open_date");

        given(projectDao.getTotalCnt(any())).willReturn(30);
        List<Project> list = new ArrayList<>();
        given(projectDao.findAllByFilterAndOrder(any())).willReturn(list);

        // when
        // 메소드 실행
        List<Project> actual = projectService.getPageList(pagination);

        // then
        // pagination 정보를 빌드하고 프로젝트 리스트를 반환해야 한다.
        // 프로젝트 리스트 반환 확인
        assertEquals(actual, list);

        // pagination 빌드 결과 확인
        Field total = pagination.getClass().getDeclaredField("total");
        Field listCnt = pagination.getClass().getDeclaredField("listCnt");
        total.setAccessible(true);
        listCnt.setAccessible(true);
        assertEquals(1, pagination.getCurPage());
        assertEquals(30, total.get(pagination));
        assertEquals(10, listCnt.get(pagination));

        // MockDao 객체 호출 확인
        verify(projectDao, times(1)).getTotalCnt(any());
        verify(projectDao, times(1)).findAllByFilterAndOrder(any());

    }
}
