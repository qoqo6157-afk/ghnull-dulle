-- ============================================================
-- 지눌가챠 SSR 3성 강화(풀돌) 기능 설치
-- 기존 캐릭터/펫/리듬/유저 세이브 데이터는 삭제하지 않습니다.
-- 한 번만 실행하면 됩니다.
-- ============================================================

alter table public.characters
  add column if not exists full_limit_image_path text;

alter table public.characters
  add column if not exists full_limit_image_url text;

comment on column public.characters.full_limit_image_path
  is 'SSR 3성 풀돌 전용 일러스트의 character-images Storage 경로';

comment on column public.characters.full_limit_image_url
  is 'SSR 3성 풀돌 전용 일러스트 공개 URL';

notify pgrst, 'reload schema';
