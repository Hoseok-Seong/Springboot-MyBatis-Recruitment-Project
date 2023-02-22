package shop.mtcoding.job.model.resume;

import java.util.List;

public interface ResumeRepository {
        public List<Resume> findAll();

        public Resume findById(int id);

        public int insert(Resume resume);

        public int updateById(Resume resume);

        public int deleteById(int id);
}
