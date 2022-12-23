@extends('layouts.main')

@section('container')
<section class="page-title bg-2">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
            <ul class="list-inline mb-0">
              <li class="list-inline-item"><a href="index.html" class="text-sm letter-spacing text-white text-uppercase font-weight-bold">Home</a></li>
              <li class="list-inline-item"><span class="text-white">|</span></li>
              <li class="list-inline-item"><a href="#" class="text-color text-uppercase text-sm letter-spacing">Gerakan Latihan</a></li>
            </ul>
             <h1 class="text-lg text-white mt-2">{{ $exercise->name }}</h1>
        </div>
      </div>
    </div>
</section>
<section class="section">
	<div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <h3 class="mb-2">{{ $exercise->name }}</h3>
                <img src="{{ asset('storage/' .$exercise->image) }}" alt="" srcset="" width="500px">
                <p class="mt-3">Lorem ipsum dolor sit amet consectetur adipisicing elit. Amet rem ipsa, molestiae tempora minima illum quisquam possimus corporis consectetur repellat veniam magnam id nesciunt praesentium omnis dolorem blanditiis! Esse eveniet maiores recusandae sed laboriosam facere, id commodi impedit aperiam doloremque eos necessitatibus quam obcaecati eum nisi, iusto eius nihil quos inventore asperiores. Quas cum perspiciatis architecto tempore recusandae eveniet veniam optio, voluptatum corrupti repellat! Voluptatem at ex consectetur, amet dolore dignissimos eum saepe obcaecati, asperiores, ipsa minus quibusdam eveniet. Ullam, excepturi architecto ad doloribus velit non? Eius, earum consectetur possimus neque animi iste dolore qui quidem suscipit repellat, esse et excepturi facilis id laborum aliquam cum aspernatur libero. Iure sit facere ullam, possimus rem vel officia magni dicta voluptatibus eos pariatur quasi hic dolorem soluta reiciendis, nihil, nesciunt unde. Beatae, illum error adipisci recusandae quo a vero distinctio consequatur! Sit repellat perspiciatis dignissimos error illo temporibus tempora, possimus saepe reiciendis ab, nam iure cumque laboriosam autem adipisci enim quidem iste quas a voluptatum doloribus architecto impedit aperiam! Deserunt totam dolor ab, dicta libero provident minus natus nobis mollitia nam. Magni cupiditate iure accusantium, eaque earum at tempora consectetur eum doloribus numquam similique sunt debitis quam saepe dolore ut omnis cum itaque, perspiciatis assumenda eveniet, provident nam enim? Ut nostrum aliquam neque a cupiditate saepe, quisquam minus repellendus sunt quam est perspiciatis inventore, animi esse illo ad reprehenderit atque eos, maxime magni maiores recusandae alias voluptatem. Alias distinctio dignissimos rerum nobis laborum quibusdam quos non similique temporibus numquam at, consectetur nesciunt corporis! Deleniti nulla culpa omnis incidunt at adipisci tempora quia vel minus iure itaque facere impedit nostrum perspiciatis, praesentium ratione quaerat magnam. Sapiente accusantium explicabo assumenda reiciendis in rerum molestias dolores, voluptas repellendus obcaecati molestiae similique dicta magnam recusandae quaerat veritatis adipisci debitis id eaque, harum deserunt! Corporis dolorum odit vitae omnis illo doloribus, laboriosam veniam molestiae expedita totam ipsum nobis enim labore eligendi laudantium asperiores ex maxime. Fugit ab corporis dolorem vitae, incidunt deserunt accusantium cumque quisquam cupiditate adipisci necessitatibus consectetur vel, nobis, nisi quos eveniet consequatur error? Ipsum explicabo nisi, minus cupiditate dolores expedita qui ea autem quis cum sed aperiam eius sit aut distinctio reprehenderit magnam reiciendis excepturi molestiae sunt nesciunt eaque ducimus esse dignissimos. Voluptates officia, doloribus ad molestiae voluptatibus facere molestias, eum eaque aspernatur obcaecati vero soluta asperiores distinctio enim dolor neque totam quam voluptatum ratione quia quaerat id excepturi! Vitae quaerat odit molestias? Architecto.</p>
            </div>
            <div class="col-lg-3 col-md-8">
                <div class="mb-5 tags">
                    <h5 class="font-secondary mb-4"><i class="ti-minus mr-2 text-color"></i>Fokus Otot</h5>
                    <div class="card">
                        <div class="card-body">
                            @if($exercise->muscles->count() > 0)
                            @foreach ($exercise->muscles as $muscle)
                            <a href="#">{{ $muscle->name }}</a>
                            @endforeach
                            @endif
                        </div>
                    </div>
                </div>

                <div class="mb-5 tags">
                    <h5 class="font-secondary mb-4"><i class="ti-minus mr-2 text-color"></i>Alat yang Digunakan</h5>
                        
                    <div class="card">
                        <div class="card-body">
                            @if($exercise->equipments->count() > 0)
                            @foreach ($exercise->equipments as $equipment)
                            <a href="#">{{ $equipment->name }}</a>
                            @endforeach
                            @endif
                        </div>
                    </div>

                    <div class="mb-5 follow mt-5">
                        <h5 class="font-secondary mb-4"><i class="ti-minus mr-2 text-color"></i>Detail</h5>
                    </div>
                </div>
            </div>
        </div>
	</div>
</section>
@endsection